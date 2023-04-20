const express = require("express");
const bodyParser = require("body-parser");
const { PrismaClient } = require("@prisma/client");

const app = express();

// parse application/json
app.use(bodyParser.json());

const prisma = new PrismaClient();

// Example GET request
app.get("/machines", async (req, res) => {
    const machines = await prisma.machineMotion.findMany({
        include: {
            drives: {
                select: {
                    motor_size: true,
                },
            },
        },
    });
    res.json(machines);
});

// Example POST request
app.post("/api/machine", async (req, res) => {
    const data = req.body;
    const machine = await prisma.machineMotion.create({
        data: {
            name: data.name,
        },
        select: {
            id: true,
        },
    });
    // Do something with the user data
    res.send(`Machine ${machine.id} added successfully!`);
});

// Start the server
const port = 1234;
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
