class ApplicationController < ActionController::API
  def render_not_found(status = :unprocessable_entity)
    render plain: "#{status.to_s.titleize} :(", status: status
  end

  def render_success(status = :ok)
    render plain: "#{status.to_s.titleize} :)", status: status
  end

  def render_ok_json data
    render json: data, status: :ok
  end
end
