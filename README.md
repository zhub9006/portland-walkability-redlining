# Portland Walkability & Redlining Analysis

Spatial analysis of redlining and walkability in Portland Oregon neighborhoods.

## Neighborhoods Included

This project contains walkability, redlining, and socioeconomic data for **86 Portland neighborhoods**.

### Recently Added — Nob Hill (ID: 999)

**Location:** 1234 NW 23rd Avenue, Portland, OR 97210  
**Coordinates:** 45.5318°N, -122.6986°W  
**Category:** Still Desirable  
**Grade:** B  
**Historically Redlined:** Yes (subsequent gentrification and affluence)

#### Neighborhood Walkability Scores (OSM-based, 1km radius)

| Category | Score | Details |
|----------|-------|---------|
| **Overall Walkability** | **10 / 10** | Exceptionally walkable urban core |
| **Public Transit** | **9.4 / 10** | 8 stops within 1km (TriMet bus + Streetcar) |
| **Shopping** | **8.8 / 10** | Multiple cafes, shops, groceries nearby |
| **Sports & Fitness** | **8.7 / 10** | 11 sports/wellness facilities nearby |
| **Dining** | **Excellent** | Dozens of restaurants & cafes on NW 23rd |
| **Parks/Green Space** | **Moderate** | Urban density, limited standalone parks |
| **Entertainment** | **Low** | Few entertainment venues within 1km |

#### Key Amenities within 1km

- **Transit:** NW 23rd & Marshall (TriMet bus + Streetcar, 128m), NW Northrup & 22nd (Streetcar, 173m)
- **Grocery:** Lovejoy Grocery (NW 23rd, ~400m), Zupan's (West Burnside, ~1.1km)
- **Cafes:** Case Study Coffee Roasters (NW 23rd, ~160m), Portal Tea (NW 23rd, ~500m), Starbucks (West Burnside)
- **Restaurants:** Henry Higgins Boiled Bagels (NW 23rd), Pepino's (Mexican), Tara Thai Northwest (Thai/Lao)
- **Bakery:** Ken's Artisan Bakery (NW 21st, ~800m)
- **Sports:** YogaSix (NW 22nd, ~260m), Orangetheory Fitness, MLC Pool (~709m)
- **Tourism:** Large Metal Pigs sculpture, Freakybuttrue Peculiarium & Museum, galleries

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

#### Neighborhood Characteristics

Nob Hill is a dense, highly desirable urban neighborhood within Portland's Northwest District. Features include vibrant dining/cafés along NW 23rd, direct Portland Streetcar & TriMet access, historic homes with modern infill, proximity to the Pearl District, and above-average income/education levels.

## Repository Structure

```
portland-walkability-redlining/
├── data/                     # Neighborhood analysis datasets
│   ├── Portland_Analysis_Data.csv   # Main 86-neighborhood dataset
│   └── nob_hill_supplemental.csv    # Nob Hill neighborhood data (NEW)
├── outputs/                  # Analysis outputs and visualizations
├── scripts/                  # Analysis and visualization scripts
├── README.md                 # This file
└── portland-walkability-redlining.Rproj
```

## Data Schema (Portland_Analysis_Data.csv)

| Column | Description |
|--------|-------------|
| NAME | Neighborhood name |
| ID | Unique neighborhood identifier |
| nbh_distri | Portland district number (1-4) |
| category | Classification: Still Desirable, Definitely Declining, Hazardous, Best, Commercial, Industrial |
| Shape_Area_1 | Area in square meters |
| grade | Redlining grade: A (Best) through D (Hazardous) |
| redlined | 1 if historically redlined, 0 if not |
| AVG_WALK | Composite walkability index (0-100) |
| Avg_Vul | Average vulnerability percentage |
| AVG_POC | Average People of Color percentage |
| AVG_INC | Average median household income (USD) |
| Shape_Length | Perimeter length in meters |
| Shape_Area | Geographic area in square meters |

## About This Project

Spatial analysis of redlining and walkability in Portland Oregon neighborhoods, combining historical HOLC redlining maps with modern OSM-derived walkability metrics to reveal persistent patterns of housing inequality.

**Data sources:** HOLC 1935 security maps, OpenStreetMap POI data, Census Bureau ACS demographics, TriMet transit locations.