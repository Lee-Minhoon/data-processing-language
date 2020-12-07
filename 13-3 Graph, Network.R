install.packages("igraph")
library(igraph)

# graph 생성
G.star <- make_star(6, mode = "undirected", center = 1) %>%
  set_vertex_attr("name", value = c("A", "B", "C", "D", "E", "F"))
plot(G.star, vertex.color = rainbow(6), vertex.size = 60)

tkplot(G.star, vertex.color = rainbow(6), vertex.size = 60)

G.ring <- make_ring(6, directed = FALSE, circular = TRUE) %>%
  set_vertex_attr("name", value = c("A", "B", "C", "D", "E", "F"))
tkplot(G.ring, vertex.color = rainbow(6), vertex.size = 30)

G.Y <- make_graph(edges = NULL, n = NULL, directed = FALSE)
G.Y <- G.Y + vertices("A", "B", "C", "D", "E", "F")
G.Y <- G.Y + edges("A", "B",
                   "A", "C",
                   "A", "D",
                   "D", "E",
                   "E", "F")
tkplot(G.Y, vertex.color = rainbow(6), vertex.size = 30)

# 지표 분석
# 연결정도
degree(G.star, normalized = FALSE)
degree(G.star, normalized = TRUE)
CD <- centralization.degree(G.star, normalized = FALSE)
Tmax <- centralization.degree.tmax(G.ring)
CD$centralization / Tmax

# 근접
closeness(G.star, normalized = FALSE)

# 중개
betweenness(G.star)

# 밀도
graph.density(G.star)
graph.density(G.Y)
graph.density(G.ring)

# 최단경로, 평균거리
shortest.paths(G.Y)
distances(G.Y, v = "A", to = "E")
average.path.length(G.Y)

# facebook dataset
filename <- "./resource/facebook_combined.txt"
df.fb <- read.table(filename, header = F)
head(df.fb)

G.fb <- graph.data.frame(df.fb, directed = FALSE)
par(mar = c(0, 0, 0, 0))
plot(G.fb, vertex.label = NA, vertex.size = 10, vertex.color = rgb(0, 1, 0, 0, 5))

# dev.off()
V(G.fb)$name
v.set <- V(G.fb)$name[1:50]
G.fb.part <- induced_subgraph(G.fb, v = v.set)
tkplot(G.fb.part, vertex.label.cex = 1.2, vertet.size = degree(G.fb.part) * 1.5,
       vertex.color = "yellow", vertex.frame.color = "gray")

v2 <- which(V(G.fb)$name == "1")
v2
v.set <- neighbors(G.fb, v = v2)
v.set
