# Srushti Fleet Dashboard

A comprehensive, Next.js-powered dashboard built for Customer Success and Operations teams to monitor fleet health, support tickets, and regional distribution.

## Features
*   **Real-time Analytics:** Track MRR, active drivers, and fleet sizes.
*   **Interactive Map:** View customer locations across the US.
*   **Deep Filtering & Sorting:** Search by name, filter by status/channel, and sort by MRR.
*   **Responsive Design:** Fully optimized for desktop and tablet viewports.

## Tech Stack
*   **Framework:** Next.js (App Router)
*   **Styling:** Tailwind CSS + Lucide React (Icons)
*   **Database:** Supabase (PostgreSQL)
*   **Mapping:** React-Leaflet

## Setup Instructions

### 1. Clone the repository
```bash
git clone <repository-url>
cd dashboard
npm install
```

### 2. Environment Variables
Create a `.env.local` file in the root directory and add your Supabase credentials:
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 3. Run Locally
```bash
npm run dev
```
Open http://localhost:3000 in your browser.