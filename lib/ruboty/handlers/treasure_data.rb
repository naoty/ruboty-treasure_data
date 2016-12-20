module Ruboty
  module Handlers
    class TreasureData < Base
      env :TREASURE_DATA_API_KEY, "An API key for Treasure Data"

      on(
        /run schedule "(?<schedule>.+)"\z/,
        name: "run_schedule",
        description: "Run a schedule",
      )

      def run_schedule(message)
        Ruboty::TreasureData::Actions::RunSchedule.new(message).call
      end
    end
  end
end
