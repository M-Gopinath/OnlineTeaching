class UrlAssist

  def self.domain(subdomain=nil)
    base_url = Rails.application.secrets.base_url
    if subdomain.present?
      env = Rails.env.to_s
      case env
      when "production"
        base_url.sub("thinkablelms", "#{subdomain}.thinkablelms")
      when "staging"
        base_url.sub("staging", "#{subdomain}.qa")
      when "development"
        base_url.sub("", subdomain)
      end
    else
      base_url
    end
  end

end
