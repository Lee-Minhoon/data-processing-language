# Call Library
library(igraph)

# Set File Path
resource_path = paste(getwd(), "/resource/", sep = "")

# 1, 3. Read Dataset
df.fb = read.table(paste(resource_path, "ca-GrQc.txt", sep = ""), header = T)
nrow(df.fb)
head(df.fb)

G.fb <- graph.data.frame(df.fb, directed = FALSE)
G.fb

# 4. Degree, Closeness, Betweenness (normalized, denormalized)
d = degree(G.fb)
cdn = centralization.degree(G.fb)
cdd = centralization.degree(G.fb, normalized = FALSE)

d_summary = summary(d)
dmax = d_summary["Max."]
dmax_node = V(G.fb)$name[d == dmax]
dmax_which = which(d == dmax)

print(paste("���� ���� ���ᰭ�� : ", dmax, sep = ""))
print(paste("���� �߽ɼ� �������� �� �߽� ��� : ", dmax_node, sep = ""))
print(paste("���� �߽ɼ� �������� �� �߽� ��� ��ȣ : ", dmax_which, sep = ""))

c = closeness(G.fb)
ccn = centralization.closeness(G.fb)
ccd = centralization.closeness(G.fb, normalized = FALSE)

c_summary = summary(c)
cmin = c_summary["Min."]
cmin_node = V(G.fb)$name[c == cmin]
cmin_which = which(c == cmin)

print(paste("���� ���� ���� �߽ɼ� : ", cmin, sep = ""))
print(paste("���� �߽ɼ� �������� �� �߽� ��� : ", cmin_node, sep = ""))
print(paste("���� �߽ɼ� �������� �� �߽� ��� ��ȣ : ", cmin_which, sep = ""))

b = betweenness(G.fb)
cbn = centralization.betweenness(G.fb)
cbd = centralization.betweenness(G.fb, normalized = FALSE)

b_summary = summary(b)
bmax = b_summary["Max."]
bmax_node = V(G.fb)$name[b == bmax]
bmax_which = which(b == bmax)

print(paste("���� ���� �߰� �߽ɼ� : ", bmax, sep = ""))
print(paste("�߰� �߽ɼ� �������� �� �߽� ��� : ", bmax_node, sep = ""))
print(paste("�߰� �߽ɼ� �������� �� �߽� ��� ��ȣ : ", bmax_which, sep = ""))

# 5, 6. Plotting
d_summary
degree.distribution(G.fb)
plot(d, type = 'h', main = "Degree Distribuion", xlab = "index", ylab = "degree")

# 7. Ten Nodes with Large Degree
dmax_ten_which = order(d, decreasing=TRUE)[1:10]
dmax_ten_node = V(G.fb)$name[dmax_ten_which]

print(dmax_ten_node)
print(dmax_ten_which)

# 8, 9 Subgraph Plotting
dmax_neighbors = neighbors(G.fb, v = dmax_which)
dmax_with_neighbors = c(dmax_which, dmax_neighbors)
dmax_subgraph = induced.subgraph(G.fb, dmax_with_neighbors)
dmax_subgraph_d = degree(dmax_subgraph)

V(dmax_subgraph)$color = ifelse(V(dmax_subgraph)$name == dmax_node, "red", "green")
V(dmax_subgraph)$label = ifelse(V(dmax_subgraph)$name == dmax_node, dmax_node, NA)
V(dmax_subgraph)$size = ifelse(V(dmax_subgraph)$name == dmax_node, 30, 
                               ifelse(dmax_subgraph_d >= 60,
                                      dmax_subgraph_d * 0.05, 3))
plot(dmax_subgraph, main = "Subgraph(Node with Largest Degree)")