// Import the HTTP module
const http = require("http");
// Import the URL module
const url = require("url");

// Make our HTTP server
const server = http.createServer((req, res) => {
    // Parse the request url
    const reqUrl = url.parse(req.url).pathname
    // Compare our request method
    if (req.method == "GET") {
        if (reqUrl == "/") {
            res.write("you're boring")
            res.end()
        }
    } else if (req.method == "POST") {
        if (reqUrl == "/hello") {
            res.write("hello world")
            res.end()
        }
    }
})
// Have the server listen on port 9000
const PORT = 3000;
server.listen(PORT, () => {
    console.log("Server Listening at http://localhost:" + PORT);
})
