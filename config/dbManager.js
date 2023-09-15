import mysql from "mysql2/promise";
import dotEnv from "dotenv";

dotEnv.config();

const dbManager = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_NAME,
    connectionLimit: 10,
    enableKeepAlive: true,
});

export default dbManager;