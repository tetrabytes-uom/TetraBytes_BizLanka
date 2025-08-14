-- CreateEnum
CREATE TYPE "public"."Role" AS ENUM ('BUSINESS_OWNER', 'GRAMA_NILADARI', 'DIVISIONAL_SECRETARY', 'AG_OFFICER', 'COUNSELOR', 'ADMIN');

-- CreateEnum
CREATE TYPE "public"."AuthProvider" AS ENUM ('CREDENTIALS', 'GOOGLE');

-- CreateTable
CREATE TABLE "public"."User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "auth_provider" "public"."AuthProvider" NOT NULL DEFAULT 'CREDENTIALS',
    "username" TEXT NOT NULL,
    "is_email_verified" BOOLEAN NOT NULL DEFAULT false,
    "role" "public"."Role" NOT NULL DEFAULT 'BUSINESS_OWNER',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "last_login" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."VerificationToken" (
    "id" TEXT NOT NULL,
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VerificationToken_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "public"."User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "public"."User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_key" ON "public"."VerificationToken"("identifier");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "public"."VerificationToken"("token");
