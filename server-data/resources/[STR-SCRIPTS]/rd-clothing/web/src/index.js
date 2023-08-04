import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import { ThemeProvider, createTheme } from "@mui/material/styles";


const root = ReactDOM.createRoot(document.getElementById('root'));

const darkTheme = createTheme({
  palette: {
    mode: "dark",
    primary: {
      light: "#F2A365",
      main: "#F2A365",
      // dark: '#F2A365',
      // contrastText: "#fff",
    },
    secondary: {
      light: "#95EF77",
      main: "#95EF77",
      // dark: '#95EF77',
      contrastText: "#000",
    },
    info: {
      light: "#e0e0e0",
      main: "#e0e0e0",
      // dark: '#95EF77',
      contrastText: "#000",
    },
  },
});


root.render(
  <React.StrictMode>
    <ThemeProvider theme={darkTheme}>
      <App />
    </ThemeProvider>
  </React.StrictMode>
);

