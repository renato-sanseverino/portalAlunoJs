const express = require('express');
const { nextApi, nextRouter } = require('express-next-api');


const port = 3000;
const app = express();

app.use("/", express.static('../dist'));  // necessário efetuar o build do frontend
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
app.use(nextApi({ base: '/api/routes', directory: 'routes', options: {caseSensitive: false} }))

// inicia a API escutando na porta 3000
app.listen(port, () => console.log('Express escutando chamadas na porta ' + port));
