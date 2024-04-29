import { CapacitorConfig } from '@capacitor/cli';
import { parse } from 'dotenv'
import { readFileSync } from 'fs'

const env = parse(readFileSync('.env'))

const config: CapacitorConfig = {
  appId: env.APP_ID,
  appName: env.APP_NAME,
  webDir: 'dist',
  server: {
    androidScheme: 'https',
    url: `http://${env.PC_LAN_IP}:5173`,
    cleartext: true,
  }
};

export default config;