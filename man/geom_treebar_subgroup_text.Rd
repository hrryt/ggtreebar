% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GeomTreecolSubgroupText.R,
%   R/geom_treebar_subgroup_text.R
\docType{data}
\name{geom_treebar_subgroup_text}
\alias{geom_treebar_subgroup_text}
\alias{GeomTreecolSubgroupText}
\alias{geom_treecol_subgroup_text}
\alias{geom_treebar_subgroup2_text}
\alias{geom_treecol_subgroup2_text}
\alias{geom_treebar_subgroup3_text}
\alias{geom_treecol_subgroup3_text}
\title{Subgroup Text Labels for Treemap Bar Charts}
\usage{
geom_treebar_subgroup_text(
  mapping = NULL,
  data = NULL,
  stat = "count",
  position = "stack",
  na.rm = FALSE,
  show.legend = FALSE,
  inherit.aes = TRUE,
  padding.x = grid::unit(1, "mm"),
  padding.y = grid::unit(1, "mm"),
  place = "bottom",
  min.size = 4,
  grow = FALSE,
  reflow = FALSE,
  fixed = NULL,
  layout = "squarified",
  start = "bottomleft",
  level = "subgroup",
  ...
)

geom_treecol_subgroup_text(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "stack",
  na.rm = FALSE,
  show.legend = FALSE,
  inherit.aes = TRUE,
  padding.x = grid::unit(1, "mm"),
  padding.y = grid::unit(1, "mm"),
  place = "bottom",
  min.size = 4,
  grow = FALSE,
  reflow = FALSE,
  fixed = NULL,
  layout = "squarified",
  start = "bottomleft",
  level = "subgroup",
  ...
)

geom_treebar_subgroup2_text(...)

geom_treecol_subgroup2_text(...)

geom_treebar_subgroup3_text(...)

geom_treecol_subgroup3_text(...)
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

\item{stat}{Override the default connection between \code{geom_treebar()} and
\code{stat_count()}.}

\item{position}{A position adjustment to use on the data for this layer. This
can be used in various ways, including to prevent overplotting and
improving the display. The \code{position} argument accepts the following:
\itemize{
\item The result of calling a position function, such as \code{position_jitter()}.
This method allows for passing extra arguments to the position.
\item A string naming the position adjustment. To give the position as a
string, strip the function name of the \code{position_} prefix. For example,
to use \code{position_jitter()}, give the position as \code{"jitter"}.
\item For more information and other ways to specify the position, see the
\link[ggplot2:layer_positions]{layer position} documentation.
}}

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

\item{padding.x, padding.y}{\code{grid::unit()} object, giving horizontal or
vertical padding between text and edge of tile. Defaults to 1 mm.}

\item{place}{Where inside the box to place the text. Default is \code{bottom};
other options are \code{topleft}, \code{top}, \code{topright}, etc.}

\item{min.size}{Minimum font size, in points. If provided, text that would
need to be shrunk below this size to fit the box will not be drawn. Defaults
to 4 pt.}

\item{grow}{If \code{TRUE}, text will be grown as well as shrunk to fill the box.}

\item{reflow}{If \code{TRUE}, text will be reflowed (wrapped) to better fit the
box.}

\item{fixed}{Deprecated. Use \code{layout = "fixed"} instead. Will be removed in
later versions.}

\item{layout}{The layout algorithm, one of either 'squarified' (the
default), 'scol', 'srow' or 'fixed'. See Details for full details on the
different layout algorithms.}

\item{start}{The corner in which to start placing the tiles. One of
'bottomleft' (the default), 'topleft', 'topright' or 'bottomright'.}

\item{level}{One of 'subgroup', 'subgroup2' or 'subgroup3', giving the
subgrouping level for which to draw text labels. It is recommended to use
the aliases \code{geom_treemap_subgroup2_text()} and
\code{geom_treemap_subgroup3_text()} instead of this argument.}

\item{...}{Other arguments passed on to \code{\link[ggplot2:layer]{layer()}}'s \code{params} argument. These
arguments broadly fall into one of 4 categories below. Notably, further
arguments to the \code{position} argument, or aesthetics that are required
can \emph{not} be passed through \code{...}. Unknown arguments that are not part
of the 4 categories below are ignored.
\itemize{
\item Static aesthetics that are not mapped to a scale, but are at a fixed
value and apply to the layer as a whole. For example, \code{colour = "red"}
or \code{linewidth = 3}. The geom's documentation has an \strong{Aesthetics}
section that lists the available options. The 'required' aesthetics
cannot be passed on to the \code{params}. Please note that while passing
unmapped aesthetics as vectors is technically possible, the order and
required length is not guaranteed to be parallel to the input data.
\item When constructing a layer using
a \verb{stat_*()} function, the \code{...} argument can be used to pass on
parameters to the \code{geom} part of the layer. An example of this is
\code{stat_density(geom = "area", outline.type = "both")}. The geom's
documentation lists which parameters it can accept.
\item Inversely, when constructing a layer using a
\verb{geom_*()} function, the \code{...} argument can be used to pass on parameters
to the \code{stat} part of the layer. An example of this is
\code{geom_area(stat = "density", adjust = 0.5)}. The stat's documentation
lists which parameters it can accept.
\item The \code{key_glyph} argument of \code{\link[ggplot2:layer]{layer()}} may also be passed on through
\code{...}. This can be one of the functions described as
\link[ggplot2:draw_key]{key glyphs}, to change the display of the layer in the legend.
}}
}
\value{
A \code{\link[ggplot2:layer]{ggplot2::layer()}}.
}
\description{
Add text labels to subgroups of a treemap bar chart generated by
\code{\link[=geom_treebar]{geom_treebar()}} or \code{\link[=geom_treecol]{geom_treecol()}}.
}
\details{
These functions take the same aesthetic mappings as \code{\link[=geom_treebar]{geom_treebar()}} and
\code{\link[=geom_treecol]{geom_treecol()}}, and are to be used in conjunction with them, ensuring that
arguments like \code{position} match where supplied.
}
\examples{
library(ggplot2)
ggplot(diamonds, aes(y = clarity, fill = cut, subgroup = color)) +
  geom_treebar(position = "dodge") +
  geom_treebar_subgroup_text(position = "dodge")
}
\seealso{
\code{\link[=geom_treebar]{geom_treebar()}}, \code{\link[=geom_treebar_subgroup_border]{geom_treebar_subgroup_border()}}.
}
\keyword{datasets}
