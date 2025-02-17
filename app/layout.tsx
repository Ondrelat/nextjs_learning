import { Inter } from "next/font/google";
import "./globals.css";
import SessionWrapper from './components/sessionWraper';
import Navbar from './ui/navbar';
import Footer from './footer';

const inter = Inter({ subsets: ["latin"] });

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode; }>) {
  return (
    <html lang="fr" className="h-full">
      <head>
        <title>Dictée Interactive - Améliorez votre orthographe</title>
      </head>
      <body className={`${inter.className} bg-gray-50 flex flex-col min-h-screen`}>
        <SessionWrapper>
          <div className="flex flex-col min-h-screen">
            <Navbar />
            <main className="flex-grow flex flex-col book-bg">
              {children}
            </main>
            <Footer />
          </div>
        </SessionWrapper>
      </body>
    </html>
  );
}