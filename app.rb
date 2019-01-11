require "sinatra"
require 'sendgrid-ruby'






get "/" do 

    

    # from = SendGrid::Email.new(email: 'awtheman@gmail.com')
    # to = SendGrid::Email.new(email: params[:usr_email])
    # subject = 'election'
    # content = SendGrid::Content.new(
    #   type: 'text/plain', 
    #   value: params[:comment]
    # )
    
    # # create mail object with from, subject, to and content
    # mail = SendGrid::Mail.new(from, subject, to, content)
    
    # # sets up the api key
    # sg = SendGrid::API.new(
    #   api_key: ENV["SENDGRID_API_KEY"]
    # )
    
    # # sends the email
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    
    # # display http response code
    # puts response.status_code
    
    # # display http response body
    # puts response.body
    
    # # display http response headers
    # puts response.headers

    
    # html = erb (:index)
    # if params[:comment]
    #     book = params[:comment]
        
    #     html += erb (:comments)
    # end
    # html

    erb :index

end

post "/contact" do

    from = SendGrid::Email.new(email: 'awtheman@gmail.com')
    to = SendGrid::Email.new(email: params[:usr_email])
    subject = 'election'
    content = SendGrid::Content.new(
      type: 'text/plain', 
      value: params[:comment]
    )
    
    # create mail object with from, subject, to and content
    mail = SendGrid::Mail.new(from, subject, to, content)
    
    # sets up the api key
    sg = SendGrid::API.new(
      api_key: ENV["SENDGRID_API_KEY"]
    )
    
    # sends the email
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    
    # display http response code
    puts response.status_code
    
    # display http response body
    puts response.body
    
    # display http response headers
    puts response.headers

    phrase = params[:comment]

    redirect "/"
 
end



