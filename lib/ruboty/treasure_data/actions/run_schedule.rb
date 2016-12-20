module Ruboty
  module TreasureData
    module Actions
      class RunSchedule
        attr_reader :message

        def initialize(message)
          @message = message
        end

        def call
          begin
            jobs = td_client.run_schedule(schedule, Time.now, nil)
          rescue ::TreasureData::NotFoundError
            message.reply("Resource not found", code: true)
            return
          rescue
            message.reply("Something wrong", code: true)
            return
          end

          job = jobs.first

          while !job.finished?
            sleep 2
            job.update_progress!
          end

          if job.success?
            table = Terminal::Table.new(rows: job.result)
            message.reply(table, code: true)
          else
            message.reply(job.result, code: true)
          end
        end

        private

        def td_client
          @td_client ||= ::TreasureData::Client.new(ENV["TREASURE_DATA_API_KEY"])
        end

        def schedule
          message[:schedule]
        end
      end
    end
  end
end
