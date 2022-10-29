const { PrismaClient } = require('@prisma/client');


// dados da conexão com o banco de dados serverless
const host     = 'ofidgnvaqxpcrcffkmwk.db.us-east-1.nhost.run'
const port     = 5432
const username = 'postgres'
const password = 'P@ssw0rd1234'
const database = 'ofidgnvaqxpcrcffkmwk'
const ssl      = false
const setSSL   = 'sslaccept=strict&sslmode=require'

// DATABASE_URL="postgres://postgres:P@ssw0rd1234@ofidgnvaqxpcrcffkmwk.db.us-east-1.nhost.run:5432/ofidgnvaqxpcrcffkmwk"
let url = `postgres://${username}:${password}@${host}:${port}/${database}`;
if (ssl) {
    url = url + `?${setSSL}`;
}

const prisma = new PrismaClient({datasources: { db: { url: url } } })

module.exports = prisma
