import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.example.app',
  appName: 'react-capacitor',
  webDir: 'dist',
  server: {
    url: 'http://192.168.1.81:5000',
    cleartext: true,
  },
};

export default config;
