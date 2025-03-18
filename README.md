# MortZilla - Modern Mortgage Calculator

A sophisticated mortgage calculator built with Laravel, Vue.js, and Tailwind CSS that helps users understand their mortgage payments, equity growth, and long-term financial implications.

![image](https://github.com/user-attachments/assets/d1b556a6-2249-43be-b06b-984dcd86011c)


## Features

- 🏠 Interactive mortgage calculator with real-time updates
- 💰 Detailed monthly payment breakdown
- 📊 Visual equity projection with customizable appreciation rates
- 📅 Comprehensive amortization schedule
- 💵 Optional costs calculator (Property Tax, Insurance, PMI, HOA)
- 📑 Detailed PDF report generation
- 📱 Responsive design for all devices

## Demo

[Live Demo](https://mortzilla.com) <!-- Will be available after deployment -->

## Tech Stack

- **Backend:** Laravel 10
- **Frontend:** Vue.js 3
- **Styling:** Tailwind CSS
- **Charts:** Chart.js
- **PDF Generation:** jsPDF + html2canvas

## Prerequisites

Before you begin, ensure you have the following installed:
- PHP >= 8.1
- Composer
- Node.js >= 16
- NPM or Yarn

## Installation

1. Clone the repository
```bash
git clone https://github.com/sandhanwalia/mort-zilla.git
cd mort-zilla
```

2. Install PHP dependencies
```bash
composer install
```

3. Install NPM dependencies
```bash
npm install
```

4. Create environment file
```bash
cp .env.example .env
```

5. Generate application key
```bash
php artisan key:generate
```

## Development

1. Start the Laravel development server
```bash
php artisan serve
```

2. Start the Vite development server
```bash
npm run dev
```

The application will be available at `http://localhost:8000`

## Building for Production

1. Build the frontend assets
```bash
npm run build
```

2. Configure your production environment variables in `.env`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with [Laravel](https://laravel.com)
- UI Components powered by [Vue.js](https://vuejs.org)
- Styled with [Tailwind CSS](https://tailwindcss.com)
- Charts by [Chart.js](https://www.chartjs.org)
- PDF generation using [jsPDF](https://github.com/parallax/jsPDF)

## Contact

harry Sandhanwalia - [@sandhanwalia](https://www.linkedin.com/in/sandhanwalia/)

Project Link: [https://github.com/sandhanwalia/mort-zilla](https://github.com/sandhanwalia/mort-zilla)
