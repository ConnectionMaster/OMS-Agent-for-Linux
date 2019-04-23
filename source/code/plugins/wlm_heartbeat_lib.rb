#!/usr/local/bin/ruby
require 'open3'
require 'json'
require 'base64'

module WLM
  
  # Wlm specific heartbeat that is independent of discovery; meant to be monitored by WLI team
  # Refer in_wlm_input for the input plugi & wlm_heartbeat.conf for config

  class WlmHeartbeat

    require_relative 'oms_common'
  
    def initialize()
    end

    def get_data(time, data_type, ip)
      data = {}
      # Capturing minimalistic data for the heartbeat
      data["Timestamp"] = time
      data["Collections"] = [{"CounterName"=>"WLIHeartbeat","Value"=>1}]
      data["Computer"] = OMS::Common.get_hostname

      return {
        "DataType" => data_type, 
        "IPName" => ip, 
        "DataItems"=> [data]
      }
    end #get_data

  end #class

end #module
