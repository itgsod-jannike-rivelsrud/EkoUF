class Email
  require 'mail'
  def self.order(content)
    Mail.defaults do
      delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                               :port      => 587,
                               :domain    => "heroku.com",
                               :user_name => "app22179239@heroku.com",
                               :password  => "3va7phns",
                               :authentication => 'plain',
                               :enable_starttls_auto => true }
    end

    mail = Mail.deliver do
      to 'jannike.rivelsrud@elev.it-gymnasiet.se'
      from 'jannike.rivelsrud@gmail.com'
      subject 'New Order'
      text_part do
        body "#{content}"
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body "Namn: #{content.first},
              Adress: #{content[1]},
              Post-nummer och -adress: #{content[2]},
              Telefonnummer: #{content[3]},
              Antal: #{content.last}"

      end
    end
  end

end