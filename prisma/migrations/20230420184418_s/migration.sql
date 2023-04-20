/*
  Warnings:

  - You are about to drop the column `error` on the `Drive` table. All the data in the column will be lost.
  - You are about to drop the column `motionComplete` on the `Drive` table. All the data in the column will be lost.
  - You are about to drop the column `sensorA` on the `Drive` table. All the data in the column will be lost.
  - You are about to drop the column `sensorB` on the `Drive` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Drive" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "motor_size" INTEGER NOT NULL,
    "machineMotionId" INTEGER,
    CONSTRAINT "Drive_machineMotionId_fkey" FOREIGN KEY ("machineMotionId") REFERENCES "MachineMotion" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Drive" ("id", "machineMotionId", "motor_size") SELECT "id", "machineMotionId", "motor_size" FROM "Drive";
DROP TABLE "Drive";
ALTER TABLE "new_Drive" RENAME TO "Drive";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
