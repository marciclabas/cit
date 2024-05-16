import { ChakraProvider, ColorModeScript, Heading, ThemeConfig, VStack, extendTheme } from '@chakra-ui/react'
import './index.css'

const config: ThemeConfig = {
  initialColorMode: import.meta.env.PROD ? 'system' : 'dark',
  useSystemColorMode: true,
}
const colors = {
  brand: {
    50: '#dffff0',
    100: '#b5f9d9',
    200: '#89f4c1',
    300: '#5cefa8',
    400: '#32eb90',
    500: '#1bd176',
    600: '#10a35b',
    700: '#057440',
    800: '#004725',
    900: '#001909',
  }
}

const theme = extendTheme({ config, colors })

function Main() {
  return (
    <VStack h='100vh' w='100vw' align='center' justify='center'>
      <Heading>React SSG</Heading>
    </VStack>
  )
}

export function App() {
  return (
    <>
      <ColorModeScript initialColorMode={config.initialColorMode} />
      <ChakraProvider theme={theme}>
        <Main />
      </ChakraProvider>
    </>
  )
}

export default App