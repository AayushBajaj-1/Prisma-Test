-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_MachineMotion" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT 'MachineMotion'
);
INSERT INTO "new_MachineMotion" ("id") SELECT "id" FROM "MachineMotion";
DROP TABLE "MachineMotion";
ALTER TABLE "new_MachineMotion" RENAME TO "MachineMotion";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
