import chalk from 'chalk';
console.log(chalk.green('Hello world from chalk!'));

// server.mjs
import { createServer } from 'node:http';

const server = createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello from Node Server I am using http api createServer object!\n');
});

// starts a simple http server locally on port 3000
const PORT = 9000
server.listen(PORT, '127.0.0.1', () => {
  console.log(chalk.red('Listening on 127.0.0.1:' + PORT));
});

// run with `node server.mjs`
