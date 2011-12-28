require 'net/http'
require 'json'
require 'ostruct'


class MCBans
  def initialize(api_key)
    @api_key = api_key
  end

  def ping
    request({'exec' => 'check'}) == 'up'
  end

  def lookup(player)
    OpenStruct.new JSON.parse(request('player' => player, 'exec' => 'playerLookup'))
  end

  def unban(player, admin='[RUBY]')
    data = {
      'player' => player,
      'admin'  => admin,
      'exec'   => 'unBan'
    }
    request(JSON.parse(data))
  end

  def local_ban(player, admin='[RUBY]', reason='Local Banned')
    data = {
      'player' => player,
      'admin'  => admin,
      'reason' => reason,
      'exec'   => 'localBan'
    }
    request(JSON.parse(data))
  end

  def global_ban(player, admin='[RUBY]', reason='Global Banned')
    data = {
      'player' => player,
      'admin'  => admin,
      'reason' => reason,
      'exec'   => 'globalBan'
    }
    request(JSON.parse(data))
  end

  def temp_ban(player, duration, measure='m', admin='[RUBY]', reason='Temp Banned')
    data = {
      'player'   => player,
      'duration' => duration,
      'measure'  => measure,
      'admin'    => admin,
      'reason'   => reason,
      'exec'     => 'globalBan'
    }
    request(JSON.parse(data))
  end

  private
  def url
    @_uri ||= URI.parse("http://api.mcbans.com/v2/#{@api_key}/")
  end

  def request(data)
    response = Net::HTTP.post_form(url, data)
    response.body
  end
end
