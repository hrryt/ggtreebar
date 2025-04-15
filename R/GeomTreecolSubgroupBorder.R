draw_panel_subgroup_border <- function(
    data,
    panel_params,
    coord,
    fixed = NULL,
    layout = "squarified",
    start = "bottomleft",
    level = "subgroup"
) {
  data <- coord$transform(data, panel_params)
  levels <- c("subgroup", "subgroup2", "subgroup3")
  if (!level %in% levels) {
    cli::cli_abort("{.arg level} must be one of {.val subgroup}, {.val subgroup2}, or {.val subgroup3}")
  }
  if (!level %in% names(data)) {
    cli::cli_abort("Can't draw text for subgroup level {.val {level}} as it is not a plot aesthetic")
  }
  levels <- levels[1:(which(levels == level))]
  treemaps <- apply(data, MARGIN = 1L, simplify = FALSE, FUN = function(data) {
    data <- as.data.frame(data)
    xlim <- c(data$xmin[1], data$xmax[1])
    ylim <- c(data$ymin[1], data$ymax[1])
    bys <- lapply(levels, function(x) data[[x]])
    areasums <- stats::aggregate(data$area, by = bys, FUN = sum)
    names(areasums) <- c(levels, "area")
    aesthetics <- c("colour", "linewidth", "linetype", "alpha")
    for (aesthetic in aesthetics) {
      areasums[aesthetic] <- unique(data[[aesthetic]])
    }
    data <- areasums
    params <- list(
      data = data,
      area = "area",
      fixed = fixed,
      layout = layout,
      start = start,
      xlim = xlim,
      ylim = ylim
    )
    for (l in levels[1:(length(levels) - 1)]) { params[l] <- l }
    data <- do.call(treemapify::treemapify, params)

    gl <- grid::rectGrob(
      x = data$xmin,
      width = data$xmax - data$xmin,
      y = data$ymax,
      height = data$ymax - data$ymin,
      default.units = "native",
      just = c("left", "top"),
      gp = grid::gpar(
        col = data$colour,
        fill = NA,
        lwd = data$linewidth,
        lty = data$linetype,
        lineend = "butt"
      )
    )
    gl$name <- grid::grobName(gl, "geom_treemap_subgroup_border")
    gl
  })
  treemaps <- do.call(grid::grobTree, treemaps)
  treemaps$name <- grid::grobName(treemaps, "geom_treecol_subgroup_text")
  treemaps
}

GeomTreecolSubgroupBorder <- ggplot2::ggproto(
  "GeomTreecolSubgroupBorder", GeomTreecol,
  default_aes = ggplot2::aes(
    colour = "grey50",
    fill = "",
    linewidth = 1,
    linetype = 1,
    alpha = 1
  ),
  draw_key = ggplot2::draw_key_blank,
  draw_panel = draw_panel_subgroup_border
)
