// Native
import { resolve } from "path";

// Environment
import dotenv from "dotenv";

// Vendor
import Joi from "joi";

export const validateEnvConfig = (
  envFilePath: string,
  configSchema: Joi.ObjectSchema<any>
) => {
  const { error, value: validateEnvConfig } = configSchema.validate(
    dotenv.config({
      path: resolve(process.cwd(), envFilePath),
    }).parsed,
    {
      allowUnknown: true,
    }
  );

  if (error) {
    throw new Error(`Config validation error: ${error.message}`);
  }

  return validateEnvConfig;
};
