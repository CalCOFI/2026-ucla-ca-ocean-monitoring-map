###################################################################################
# paths.R
#
# Shared file-path configuration for the monitoring-map pipeline.
# Sourced by build_program_layer.R, build_discharger_layer.R, build_combine_map.R
# so every script references the same input data folder and output location.
#
# - dir_data : raw input data root (shared Google Drive folder).
#              Override per-machine with the CALCOFI_DATA environment variable.
# - dir_out  : built layers (GeoJSON/CSV), synced to Google Cloud Storage.
###################################################################################

library(here)
library(glue)

# raw input data root; override with env var CALCOFI_DATA for other machines
dir_data <- Sys.getenv(
  "CALCOFI_DATA",
  unset = "~/My Drive/projects/calcofi/data-public/_projects/ca-ocean-monitoring-map") |>
  path.expand()

# repo-anchored locations (here() resolves to the project root via the .Rproj)
dir_out <- here("outputs")  # built layers, synced to GCS
dir_tmp <- here("tmp")
dir_web <- here("web")
dir.create(dir_out, showWarnings = FALSE, recursive = TRUE)
dir.create(dir_tmp, showWarnings = FALSE, recursive = TRUE)

# reference files (live alongside the program CSVs in dir_data)
attribute_table_path <- glue("{dir_data}/Attribute_Table.csv")
ca_boundary_path     <- glue("{dir_data}/ca_state/CA_State.shp")
gebco_raster_path    <- glue("{dir_data}/gebco_2025_n48.0_s30.0_w-130.0_e-110.0_geotiff.tif")

stopifnot(dir.exists(dir_data))
