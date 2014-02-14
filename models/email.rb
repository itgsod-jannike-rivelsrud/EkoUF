class Email
  require 'mail'
  def self.order(content)
    Mail.defaults do
      delivery_method :smtp, { :address   => "smtp.gmail.com",
                               :port      => 587,
                               :domain    => "gmail.com",
                               :user_name => "jannike.rivelsrud@gmail.com",
                               :password  => "01793326",
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