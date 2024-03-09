/*
  Warnings:

  - You are about to drop the column `email` on the `ongs` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `ongs` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ongs" DROP COLUMN "email",
ADD COLUMN     "user_id" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ongs" ADD CONSTRAINT "ongs_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
