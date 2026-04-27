# Customer Overview Dashboard

A modern, responsive customer management dashboard built with Next.js, Supabase, and Tailwind CSS. This application provides a quick health scan of assigned accounts, displaying key metrics, customer locations on an interactive map, and a filterable list of customers.

## Features

- **Key Metrics Dashboard**: View total customers, MRR (Monthly Recurring Revenue), healthy accounts, and at-risk accounts at a glance.
- **Interactive Customer Map**: Geographical visualization of your customer base using `react-leaflet`.
- **Customer List & Filtering**: Sort, search, and filter customers by name, status, and MRR.
- **Real-time Data**: Powered by Supabase for fast and reliable data fetching.

## Tech Stack

- **Framework**: Next.js (App Router)
- **Styling**: Tailwind CSS
- **Database & Backend**: Supabase
- **Icons**: Lucide React
- **Maps**: React Leaflet

## Getting Started

### Prerequisites

Make sure you have Node.js installed on your machine along with npm, yarn, or pnpm.

### Installation

1. Clone the repository and navigate to the project directory:
   ```bash
   cd dashboard
   ```

2. Install dependencies:
   ```bash
   npm install
   # or
   yarn install
   ```

3. Set up environment variables:
   Create a `.env.local` file in the root directory and add your Supabase credentials:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. Start the development server:
   ```bash
   npm run dev
   # or
   yarn dev
   ```

5. Open http://localhost:3000 with your browser to see the result.

## Project Structure

- `app/page.tsx` - The main dashboard view integrating metrics, filters, map, and table.
- `components/` - Reusable UI components including `StatCard`, `CustomerMap`, and `CustomerFilters`.
- `utils/supabase.ts` - Supabase client initialization.
