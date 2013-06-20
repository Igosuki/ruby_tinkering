require_relative 'server'

describe HelloServer do

  let(:server) { HelloServer.new }

  it "serves content from public folder" do
    call_on("/").first.should == 200
    call_on("/")[1]['Content-Type'].should == "text/html"

    call_on("/index.html").first.should == 200
    call_on("/index.html")[1]['Content-Type'].should == "text/html"

    call_on("/invalid").first.should == 404

    call_on("/images").first.should == 200
    call_on("/images/").first.should == 200

    call_on("/images/rack-logo.png").first.should == 200
    call_on("/images/rack-logo.png")[1]['Content-Type'].should == "image/png"

    call_on("/../../../../forbidden").first.should == 403
    call_on("/has%20a%20space/").first.should == 200
  end

  def call_on(path)
    server.call(Hash["REQUEST_PATH", path])
  end

end