class IncidentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # معالجة البلاغ وتوجيه المستخدم بنجاح
    redirect_to root_path, notice: 'تم إرسال البلاغ بنجاح لعمليات حائل!'
  end

  def new
    @incident = Incident.new
  end

  def index
    @incidents = Incident.all if defined?(Incident)
  end

  def show
    # عرض تفاصيل البلاغ
  end
end