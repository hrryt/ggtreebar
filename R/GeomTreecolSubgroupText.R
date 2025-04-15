draw_panel_subgroup_text <- function(
    data,
    panel_params,
    coord,
    padding.x = grid::unit(1, "mm"),
    padding.y = grid::unit(1, "mm"),
    min.size = 4,
    grow = FALSE,
    reflow = FALSE,
    place = "bottom",
    fixed = NULL,
    layout = "squarified",
    start = "bottomleft",
    level = "subgroup") {
  data <- coord$transform(data, panel_params)
  levels <- c("subgroup", "subgroup2", "subgroup3")
  if (!level %in% levels) {
    cli::cli_abort("{.arg level} must be one of {.val subgroup}, {.val subgroup2}, or {.val subgroup3}")
  }
  if (!level %in% names(data)) {
    cli::cli_abort("Can't draw text for subgroup level {.val {level}} as it is not a plot aesthetic")
  }
  levels <- levels[1:(which(levels == level))]
  # Standardise the place argument
  if (place %in% c("middle", "center")) {
    place <- "centre"
  }
  treemaps <- apply(data, MARGIN = 1L, simplify = FALSE, FUN = function(data) {
    data <- as.data.frame(data)
    xlim <- c(data$xmin[1], data$xmax[1])
    ylim <- c(data$ymin[1], data$ymax[1])
    bys <- lapply(levels, function(x) data[[x]])
    areasums <- stats::aggregate(data$area, by = bys, FUN = sum)
    names(areasums) <- c(levels, "area")
    aesthetics <- c(
      "colour",
      "size",
      "alpha",
      "family",
      "fontface",
      "angle",
      "lineheight"
    )
    for (aesthetic in aesthetics) {
      values <- data[[aesthetic]]
      names(values) <- data[[level]]
      areasums[aesthetic] <- values[as.character(areasums[[level]])]
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
    names(data)[names(data) == level] <- "label"

    # Use treemapify's fittexttree to draw text
    gl <- grid::gTree(
      data = data,
      padding.x = padding.x,
      padding.y = padding.y,
      place = place,
      min.size = min.size,
      grow = grow,
      reflow = reflow,
      cl = "fittexttree"
    )
    gl$name <- grid::grobName(gl, "geom_treemap_subgroup_text")
    gl
  })
  treemaps <- do.call(grid::grobTree, treemaps)
  treemaps$name <- grid::grobName(treemaps, "geom_treecol_subgroup_text")
  treemaps
}

GeomTreecolSubgroupText <- ggplot2::ggproto(
  "GeomTreecolSubgroupText", GeomTreecol,
  default_aes = ggplot2::aes(
    colour = "grey20",
    size = 36,
    alpha = 1,
    family = "",
    fontface = 1,
    angle = 0,
    lineheight = 0.9
  ),
  rename_size = FALSE,
  draw_key = ggplot2::draw_key_text,
  draw_panel = draw_panel_subgroup_text
)
