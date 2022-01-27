require 'socket'

def run_server
  server = TCPServer.new(2345)

  loop do
    socket = server.accept

    request = get_lines_until_blank_line(socket)
    puts "=== GOT REQUEST ==="
    puts request
    puts "=== END REQUEST ==="

    if request.start_with? "GET / HTTP/1.1"
      response = "Hello World!\n"
    elsif request.start_with? "GET /secret_page HTTP/1.1"
      response = "1. The gold is buried at harald creek\n"
      response += "2. OK I only have one secret"
    else
      response = "Nothing found :("
    end

    http_response = build_http_response(response)
    socket.print http_response

    puts "=== SENT RESPONSE ==="
    puts http_response
    puts "=== END RESPONSE ==="
    puts "\n"

    socket.close
  end
end

def get_lines_until_blank_line(socket)
  message = ""
  loop do
    line = socket.gets
    if line.chomp == ""
      break
    else
      message += line
    end
  end
  message
end

def build_http_response(response)
  "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/plain\r\n" +
    "Content-Length: #{response.bytesize}\r\n" +
    "Connection: close\r\n" +
    "\r\n" +
    response
end

run_server