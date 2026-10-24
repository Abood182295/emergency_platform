require "test_helper"

class AuthRbacTest < ActionDispatch::IntegrationTest
  setup do
    @admin = User.create!(email: "admin@example.test", password: "AdminPassword!2026", password_confirmation: "AdminPassword!2026", role: :administrator)
    @responder = User.create!(email: "responder@example.test", password: "ResponderPassword!2026", password_confirmation: "ResponderPassword!2026", role: :responder)
  end

  test "valid credentials log in and show the administrator dashboard" do
    post login_path, params: { email: @admin.email, password: "AdminPassword!2026" }
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_response :success
    assert_select "h1", "أهلاً بك في مركز العمليات"
    assert_select "span", text: /Administrator/
  end

  test "invalid credentials show a friendly message and do not create a session" do
    post login_path, params: { email: @admin.email, password: "incorrect" }
    assert_response :unauthorized
    assert_select "div[role=alert]", /غير صحيحة/
    assert_nil session[:user_id]
  end

  test "logout clears the session" do
    sign_in_as(@admin, "AdminPassword!2026")
    delete logout_path
    assert_redirected_to login_path
    assert_nil session[:user_id]
    get dashboard_path
    assert_redirected_to login_path
  end

  test "responder receives forbidden status for administrator route" do
    sign_in_as(@responder, "ResponderPassword!2026")
    get role_dashboard_path("administrator")
    assert_response :forbidden
    assert_select "h1", "عذراً، لا تملك الصلاحية"
  end

  private

  def sign_in_as(user, password)
    post login_path, params: { email: user.email, password: password }
    assert_redirected_to dashboard_path
  end
end
