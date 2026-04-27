# Product Requirements Document (PRD) - Srushti Fleet Dashboard

## 1. Problem Statement
Fleet management companies struggle to maintain a unified view of their customer health. Data is siloed across telematics providers (fleet size, age), support channels (tickets, CSAT), and billing systems (MRR, Tier). Customer Success Managers (CSMs) lack a single "pane of glass" to proactively identify churn risks, prioritize support tickets, and analyze regional usage trends.

## 2. User Personas
*   **Customer Success Manager (CSM):** Needs to monitor account health, prioritize at-risk accounts, and review MRR vs. Support volume.
*   **Operations Analyst:** Needs to dive into the technical details of the fleet, such as vehicle types, telemetry providers, and damage rates.

## 3. Scope & Prioritization
### P0 (Must Have - Completed)
*   Aggregated metrics dashboard (Total Vehicles, MRR, Health Status).
*   Interactive tables with real-time filtering, searching, and sorting.
*   Visualizations showing fleet composition (Donut charts) and usage trends (Line/Bar charts).
*   US Map View mapping physical customer locations to surface regional insights.

### P1 (Fast Follows - Future Scope)
*   User Authentication & Role-Based Access Control (RBAC).
*   CSV/Excel Export functionality for tables.
*   Alerting/Notifications for when a customer drops to "At Risk" status.

## 4. Tradeoffs & Design Decisions
*   **Tech Stack:** Chose Next.js App Router for Server-Side Rendering (SSR) to ensure fast initial loads, paired with Supabase for rapid database prototyping and seamless API generation over writing a custom Node/Express backend.
*   **Map Implementation:** Opted for `react-leaflet` (OpenStreetMap) over Google Maps to avoid API key bottlenecks and ensure the reviewer can run the app locally without configuring external billing accounts.
*   **Data Fetching:** Handled sorting and filtering on the server via Supabase queries instead of purely client-side JavaScript. This ensures the app scales effortlessly if the database grows from 4 accounts to 40,000 accounts.

## 5. Success Metrics
*   **CSM Efficiency:** Reduce the time it takes to pull a "Customer Health Report" from multiple hours to < 10 seconds.
*   **Churn Prevention:** Surface "At Risk" clients faster by correlating high support ticket age with low CSAT scores.