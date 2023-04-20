/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Post";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "MachineMotion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "Drive" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "motor_size" INTEGER NOT NULL,
    "sensorA" BOOLEAN NOT NULL,
    "sensorB" BOOLEAN NOT NULL,
    "motionComplete" BOOLEAN NOT NULL,
    "error" TEXT,
    "machineMotionId" INTEGER,
    CONSTRAINT "Drive_machineMotionId_fkey" FOREIGN KEY ("machineMotionId") REFERENCES "MachineMotion" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
