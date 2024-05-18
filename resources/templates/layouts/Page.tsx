import DesktopPage from './DesktopPage'
import MobilePage from './MobilePage'

export function Page() {
  const layout = 'desktop'
  return layout === 'desktop' ? <DesktopPage /> : <MobilePage />
}

export default Page