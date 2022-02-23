/*
  Warnings:

  - You are about to drop the column `published` on the `User` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "State" AS ENUM ('available', 'unavailable', 'misplaced', 'broken');

-- AlterTable
ALTER TABLE "User" DROP COLUMN "published";

-- CreateTable
CREATE TABLE "Patrimony" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "state" "State" NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Patrimony_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Patrimony_userId_key" ON "Patrimony"("userId");

-- AddForeignKey
ALTER TABLE "Patrimony" ADD CONSTRAINT "Patrimony_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
