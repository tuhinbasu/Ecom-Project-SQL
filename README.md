<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>E-Commerce Conversion Analysis — README</title>
  <style>
    body { font-family: Arial, Helvetica, sans-serif; color: #222; line-height: 1.5; padding: 24px; max-width: 900px; margin: auto; }
    h1 { margin-bottom: 6px; font-size: 26px; }
    h2 { margin-top: 20px; font-size: 18px; color: #111; }
    p { margin: 8px 0; }
    ul { margin: 6px 0 12px 20px; }
    table { border-collapse: collapse; margin: 8px 0; width: 100%; max-width: 700px; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    th { background: #f5f5f5; }
    code { background: #f4f4f4; padding: 2px 6px; border-radius: 4px; }
    .kpi { display:inline-block; padding:6px 10px; background:#f0f8ff; margin:6px 6px 6px 0; border-radius:6px; }
    footer { margin-top: 28px; font-size: 13px; color: #555; }
  </style>
</head>
<body>
  <h1>E-Commerce Conversion Analysis</h1>
  <p><strong>Simple portfolio README</strong> for the SQL-based customer journey project.</p>

  <h2>Project Summary</h2>
  <p>
    Analyze session-level e-commerce data to understand conversion drivers, funnel drop-offs,
    and user behavior. Analysis is done in <strong>MySQL</strong> and visualized in <strong>Excel</strong>.
  </p>

  <h2>Dataset (high-level)</h2>
  <ul>
    <li><strong>SessionID</strong> — unique session identifier</li>
    <li><strong>UserID</strong> — unique user identifier</li>
    <li><strong>Timestamp</strong> — event date/time</li>
    <li><strong>PageType</strong> — home / product_page / cart / checkout / confirmation</li>
    <li><strong>DeviceType</strong> — Desktop / Mobile / Tablet</li>
    <li><strong>Country</strong>, <strong>ReferralSource</strong></li>
    <li><strong>TimeOnPage_seconds</strong>, <strong>ItemsInCart</strong>, <strong>Purchased</strong></li>
  </ul>

  <h2>Key Insights (summary)</h2>
  <div class="kpi">Overall conversion: <strong>20.2%</strong></div>
  <div class="kpi">Top referral: <strong>Google (21.6%)</strong></div>
  <div class="kpi">Peak hour: <strong>15:00 (3 PM)</strong></div>

  <table>
    <thead>
      <tr><th>Finding</th><th>Short implication</th></tr>
    </thead>
    <tbody>
      <tr><td>Buyers spend more time on Cart (≈100s)</td><td>Cart is final review stage — optimize UX and trust signals</td></tr>
      <tr><td>Non-buyers spend more time on Home (≈98s)</td><td>Improve home recommendations and CTAs to drive product discovery</td></tr>
      <tr><td>Higher cart depth → higher conversion</td><td>Promote bundles and bulk discounts to increase AOV</td></tr>
      <tr><td>Conversions peak mid-afternoon and mid-month</td><td>Schedule promotions and campaign pushes in these windows</td></tr>
    </tbody>
  </table>

  <h2>Business Recommendations</h2>
  <ul>
    <li>Prioritize spend on Google & Email (higher conversion ROI).</li>
    <li>Optimize mobile checkout and cart UX to reduce drop-offs.</li>
    <li>Run targeted mid-day and mid-month promotions for higher lift.</li>
    <li>Use cart-size based remarketing and bundle offers to increase conversions.</li>
  </ul>

  <h2>Project Files / Folder Structure</h2>
  <pre><code>
ecommerce-conversion-analysis/
├─ README.html                # (this file)
├─ sql_queries/
│  ├─ 01_create_schema.sql
│  ├─ 02_load_data.sql
│  ├─ 03_session_summary.sql
│  └─ ...
├─ datasets/
│  └─ customer_journey.csv
├─ visuals/
│  └─ funnel_chart.png
└─ report/
   └─ Ecommerce_Conversion_Analysis_Tuhin_Basu.pdf
  </code></pre>

  <h2>How to run (quick)</h2>
  <ol>
    <li>Load <code>customer_journey.csv</code> into MySQL (or your DB).</li>
    <li>Create normalized tables: <code>users</code>, <code>sessions</code>, <code>events</code>, <code>aggregatedb_date</code>.</li>
    <li>Run the analysis SQL scripts in <code>sql_queries/</code> to generate summary tables.</li>
    <li>Export summary tables to Excel for charts and dashboards.</li>
  </ol>

  <h2>Skills Demonstrated</h2>
  <ul>
    <li>SQL data modeling, joins, aggregations, CTEs, window functions</li>
    <li>Funnel analysis, time-series aggregation, segmentation</li>
    <li>Translating analysis into business recommendations</li>
  </ul>

  <footer>
    <p>Author: <strong>Tuhin Basu</strong> &nbsp;|&nbsp; Contact: add your email or LinkedIn</p>
  </footer>
</body>
</html>
