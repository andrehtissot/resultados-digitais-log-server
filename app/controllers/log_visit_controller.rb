class LogVisitController < ApplicationController
  protect_from_forgery except: :create

  def create
    allowDifferentOrigin
    respond_to do |format|
      begin
        checked_params = params.require([:messageId, :log])
        log_data = checked_params[1].split(';')
        loops = log_data.count / 3 - 1
        for i in 0..loops
          PageVisit.create! contact_message_id: checked_params[0], url: log_data[i*3+2],
            page_name: log_data[i*3], time: DateTime.strptime(log_data[i*3+1], '%Q')
        end
        format.json { render json: {status: :success}, status: :created }
      rescue Exception => e
        format.json { render json: {status: :failure}, status: :unprocessable_entity }
      end
    end
  end
end
