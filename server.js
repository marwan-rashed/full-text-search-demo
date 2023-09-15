import express from "express";
import dbManager from "./config/dbManager.js";

const app = express();
app.use(express.json());

app.get("/" , (_, res) => {
    res.status(200).json({
        message: "Server is running ..."
    })
});

app.get("/:keyword", async (req, res) => {
    const keyword = req.params.keyword;

    const [result] = await dbManager.query(`
        SELECT document_id, path, content
        FROM documents
        WHERE MATCH (content) AGAINST ('${keyword}');
    `);

    res.status(200).json(result);
})

app.listen(5000, () => {
    console.log("Server is running on PORT 5000 ...")
});