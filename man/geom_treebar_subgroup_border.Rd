% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_treebar_subgroup_border.R
\name{geom_treebar_subgroup_border}
\alias{geom_treebar_subgroup_border}
\alias{geom_treecol_subgroup_border}
\alias{geom_treebar_subgroup2_border}
\alias{geom_treecol_subgroup2_border}
\alias{geom_treebar_subgroup3_border}
\alias{geom_treecol_subgroup3_border}
\title{Subgroup Borders for Treemap Bar Charts}
\usage{
geom_treebar_subgroup_border(
  mapping = NULL,
  data = NULL,
  stat = "count",
  position = "stack",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  fixed = NULL,
  layout = "squarified",
  start = "bottomleft",
  level = "subgroup",
  ...
)

geom_treecol_subgroup_border(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "stack",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  fixed = NULL,
  layout = "squarified",
  start = "bottomleft",
  level = "subgroup",
  ...
)

geom_treebar_subgroup2_border(...)

geom_treecol_subgroup2_border(...)

geom_treebar_subgroup3_border(...)

geom_treecol_subgroup3_border(...)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}}. If specified and
\code{inherit.aes = TRUE} (the default), it is combined with the default mapping
at the top level of the plot. You must supply \code{mapping} if there is no plot
mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[ggplot2:ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[ggplot2:fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{stat}{The statistical transformation to use on the data for this
layer, either as a \code{ggproto} \code{Geom} subclass or as a string naming the
stat stripped of the \code{stat_} prefix (e.g. \code{"count"} rather than
\code{"stat_count"})}

\item{position}{Position adjustment, either as a string naming the adjustment
(e.g. \code{"jitter"} to use \code{position_jitter}), or the result of a call to a
position adjustment function. Use the latter if you need to change the
settings of the adjustment.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}

\item{fixed}{Deprecated. Use \code{layout = 'fixed'} instead. Will be removed in
later versions.}

\item{layout}{The layout algorithm, one of either 'squarified' (the
default), 'scol', 'srow' or 'fixed'. See Details for full details on the
different layout algorithms.}

\item{start}{The corner in which to start placing the tiles. One of
'bottomleft' (the default), 'topleft', 'topright' or 'bottomright'.}

\item{level}{One of 'subgroup', 'subgroup2' or 'subgroup3', giving the
subgrouping level for which to draw borders. It is recommended to use the
aliases \code{geom_treemap_subgroup2_border()} and \code{geom_treemap_subgroup3_border()}
instead of this argument.}

\item{...}{Other arguments passed on to \code{\link[ggplot2:layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{colour = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}
}
\description{
Add borders to subgroups of a treemap bar chart generated by
\code{\link[=geom_treebar]{geom_treebar()}} or \code{\link[=geom_treecol]{geom_treecol()}}.
}
\details{
These functions take the same aesthetic mappings as \code{\link[=geom_treebar]{geom_treebar()}} and
\code{\link[=geom_treecol]{geom_treecol()}}, and are to be used in conjunction with them, ensuring that
arguments like \code{position} match where supplied.
}
\examples{
library(ggplot2)
ggplot(diamonds, aes(y = clarity, fill = color, subgroup = color, subgroup2 = cut)) +
  geom_treebar(position = "dodge") +
  geom_treebar_subgroup_border(position = "dodge", linewidth = 2)
}
\seealso{
\code{\link[=geom_treebar]{geom_treebar()}}, \code{\link[=geom_treebar_subgroup_text]{geom_treebar_subgroup_text()}}.
}
