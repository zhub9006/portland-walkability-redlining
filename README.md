# Portland Walkability & Redlining Analysis

Spatial analysis of redlining and walkability in Portland Oregon neighborhoods.

## About This Project

This repository contains walkability, redlining, and socioeconomic data for **Portland neighborhoods**, analyzing historical HOLC (Home Owners' Loan Corporation) redlining grades alongside modern walkability metrics derived from OpenStreetMap data.

The analysis uses a **1km radius** around neighborhood center points to compute walkability scores across multiple categories, revealing spatial patterns between historical redlining and current neighborhood accessibility.

## Neighborhoods Included

### Recently Added — Nob Hill (ID: 999)

**Location:** 1234 NW 23rd Avenue, Portland, OR 97210  
**Coordinates:** 45.5318°N, -122.6986°W  
**Category:** Still Desirable  
**Grade:** B  
**Historically Redlined:** Yes (subsequent gentrification and affluence)

#### Neighborhood Walkability Scores (OSM-based, 1km radius)

| Category | Score | Details |
|----------|-------|---------|
| **Overall Walkability** | **10 / 10** | Exceptionally walkable— Virtually all daily needs within walking distance |
| **Public Transit** | **9.4 / 10** | 8 stops within 1km (TriMet bus + Streetcar) |
| **Shopping** | **8.8 / 10** | Multiple cafes, shops, groceries nearby |
| **Sports & Fitness** | **8.7 / 10** | 11 sports/wellness facilities nearby |
| **Dining** | **Excellent** | Dozens of restaurants & cafes on NW 23rd Ave |
| **Parks/Green Space** | **4.3 / 10** | Urban density, limited standalone parks |
| **Entertainment** | **Low** | Few entertainment venues within 1km |
| **Healthcare** | **9.8 / 10** | 6 healthcare/pharmacy facilities within 1km |
| **Education** | **2.9 / 10** | Limited schools within 1km radius |

#### Key Amenities within 1km

**Transit:**
- NW 23rd & Marshall (TriMet bus Route 18/19, Portland Streetcar NS Line) — 128m
- NW Northrup & 22nd (Portland Streetcar NS Line) — 173m

**Grocery & Shopping:**
- Lovejoy Grocery (NW 23rd Ave, 173m) — Convenience store
- Natural Mart #3 (NW 19th Ave, 875m) — Convenience store
- Zupan's (W Burnside, 955m) — Supermarket
- Ken's Artisan Bakery (NW 21st, ~800m)

**Cafes:**
- Case Study Coffee Roasters (NW 23rd Ave, 160m)
- Portal Tea (NW 23rd Ave, 500m)
- Starbucks (W Burnside)

**Dining:**
- Henry Higgins Boiled Bagels (NW 23rd Ave)
- Pepino's (Mexican)
- Tara Thai Northwest (Thai/Lao)

**Sports & Fitness:**
- YogaSix (NW 22nd, ~260m)
- Orangetheory Fitness
- MLC Pool (~709m)

**Healthcare:**
- Walgreens Pharmacy (NW 23rd Ave, 38m)
- Integrative Primary Care Associates (NW Lovejoy St, 452m)
- Portland Dermatology Clinic (NW Northrup St, 985m)

**Education:**
- Bridges Middle School (NW Overton St, 816m)

**Tourism & Culture:**
- Large Metal Pigs sculpture
- Freakybuttrue Peculiarium & Museum
- Nearby galleries on NW 23rd Ave

#### Demographic Estimates (Supplemental)

| Metric | Value |
|--------|-------|
| Neighborhood ID | 999 (supplemental) |
| Estimate Area | 850,000 m² |
| Grade | B (Desirable/Gentrified) |
| Vacancy Rate (est.) | 22% |
| Pop. of Color % (est.) | 18% |
| Median Income (est.) | $85,200 |
| Street Length (est.) | 3,800 m |

#### Data Sources

- OpenStreetMap POI/amenity data (2025-2026 captures)
- OSM neighborhood walkability analysis (1km radius)
- Historical HOLC redlining grades
- Census Bureau ACS estimates
- TriMet transit stop locations

## Data Structure

- `data/` — CSV files with neighborhood-level trail data
- `scripts/` — R scripts for analysis and visualization
- `outputs/` — Generated plots and analysis results

## Repository Structure

```
portland-walkability-redlining/
├── data/
│   ├── Portland_Analysis_Data.csv
│   ├── nob_hill_supplemental.csv
│   ├── nob_hill_neighborhood_profile.json
│   └── ...
├── scripts/
│   └── ...
├── outputs/
│   └── ...
├── README.md
└── .gitignore
```

## Methodology

Walkability scores are computed by:
1. Identifying all points of interest (POIs) within a 1km radius of neighborhood center coordinates
2. Categorizing POIs into amenity types (groceries, restaurants, transit, healthcare, etc.)
3. Scoring each category based on count proximity, and density
4. Comparing against historical HOLC redlining grades to identify spatial correlations

## Contributing

To add a new neighborhood:
1. Add a row to `data/Portland_Analysis_Data.csv` with the neighborhood's walkability metrics
2. Create a `data/[neighborhood_name]_supplemental.csv` with detailed OSM analysis
3. Include a `data/[neighborhood_name]_neighborhood_profile.json` with full details
4. Update this README with neighborhood summary data

## License

This project is open source.
