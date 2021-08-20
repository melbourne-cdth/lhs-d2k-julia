### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 78c5a32c-fef3-11eb-0560-6592672bbca5
begin
    using PlutoUI
	using YAML
	using Plots
	using PrettyPrinting
end


# ╔═╡ 7feba529-29c5-4be5-aeba-00db5397c4da
md"""
# Identifying, Labeling, and Relating Biomedical Data

In this notebook we will be exploring what data look like in biomedical documents and how combining data creates information. For this exercise, our view of data and is strongly informed by this 

> Data...is the raw stuff: what is collected by instrumentation or machinery. The stream of bits sent to Earth by a Mars Rover, for example, is data. The signal carried by radio frequencies between your phone and the local cell tower is data....
> 
> 
> Data is stuff. It is raw, unprocessed, possibly even untouched by human hands, unviewed by human eyes, un-thought-about by human minds. We’re not used to thinking of information objects in this way: we’re used to thinking of information objects as things like books, or files on our computer, things that have been deliberately created by humans, and where human understanding is an integral part of their creation. However, think about the stream of bits sent to Earth by the Mars Rover, or a book in, for example, Lushootseed (or some other language that you neither speak nor read… and apologies if you actually do know Lushootseed): you may know that a stream of bits or a book in Lushootseed has some meaning embedded in it, but without some processing, that meaning is not accessible to you. **Data is potential information, analogous to potential energy: work is required to release it.** (Pomerantz, Jeffrey. *Metadata (MIT Press Essential Knowledge series)* (pp. 20-21). The MIT Press. Kindle Edition.)
"""

# ╔═╡ 2ccc8246-67cd-47ac-82a3-a06b23eb0a7d
md"""

## Example

Here are some actual data:

```
141/73 6/3/2021
```

### What do you think these data and are what do they represent?

"""

# ╔═╡ ccd85c80-99d8-48c5-8a23-143a402d6ff0
md"""
#### At the most "atomistic" view we have the following (unique) data:

```
'1' '4' '1' '/' '7' '3' ' ' '6' '/' '3' '/' '2' '0' '2' '1'
```

#### Or we could view numbers as belonging together and spaces and '/' representing something else:

```
'141' '/' '73' ' ' '6' '/' '3' '/' '2021'
```

#### Or we could view spaces as separating pieces of data:

```
'141/73' '6/3/2021'

```
"""

# ╔═╡ 9064db1d-3031-4e43-943d-1e601821e44f
md"""### What are some of the ways we can interpret the `141/73` data?

#### Be creative!"""

# ╔═╡ 7a611c30-c745-4ade-881e-cec71e4f6973
md"""#### Type your answers here
$(@bind resp1 TextField((80,7)))
"""

# ╔═╡ 3b245fa2-1f83-45c3-9b3b-5fa62d002818
let answer1 = md"""

#### 141/73?

- $(parse(Int, "141", base=8) / parse(Int, "73", base=8 )) Assuming Base 8  Integer
- $(parse(Int, "141", base=8) / parse(Int, "73", base=16)) Assuming Base 16 Integer
- $(parse(Int, "141", base=8) / parse(Int, "73", base=10)) Assumint Base 10 Integer
- Systolic blood pressure of 141 and Diastolic blood pressure of 73
"""
	
HTML("<details><summary><strong>My Answers</strong></summary>$(html(answer1))</details>")
    end

# ╔═╡ 9d4a1119-bbbe-4d26-af88-6789420ab030
md"""### What if I tell you it is health-related data?"""

# ╔═╡ 9a4bd43f-c2ae-4dc1-8b33-6a4422c4bcfb


# ╔═╡ 97c45761-4f20-4063-800f-ce9d79111466
md"""#### Type your answers here
$(@bind resp1b TextField((80,7)))
"""

# ╔═╡ 15193b6b-98b5-4cf6-bf65-3133ca734112
md"""#### What are some of the ways we can interpret the '6/3/2021' data?"""

# ╔═╡ bccd1a45-33aa-43a1-8f70-68cd9a40c41f
md"""#### Type your answers here
$(@bind resp1c TextField((80,7)))
"""

# ╔═╡ 4efcfeaa-eb86-4cf3-b4e9-60210278991a
let answer2 = md"""#### 6/3/2021?

- $(6/3/2021) Assuming base 10 and `/` indicates division
- 6 March 2021
- 3 June 2021
"""
	
HTML("<details><summary><strong>My Answers</strong></summary>$(html(answer2))</details>")
    end

# ╔═╡ bd257e42-52b5-4fd6-9214-596617a5c10d
md"""## What are they actually?"""


# ╔═╡ d95f2476-0286-4aa3-ab25-c6d50b113c04
let answer4 = md"""
- 141/73
  - My maximum and minimum heart rate (beats per minute) on this bikeride

#### Anyone guess this as the physisological quantity?
"""

HTML("<details><summary><strong>My Answers</strong></summary>$(html(answer4))</details>")
    end

# ╔═╡ 08349618-e3a3-4d99-a56d-e145544266e2
let answer3 = md"""
- June 3, 2021 
  - The date of a bike ride I recorded on Strava

#### Anyone guess this date?

"""
HTML("<details><summary><strong>My Answers</strong></summary>$(html(answer3))</details>")
    end

# ╔═╡ bc69ad62-1199-4372-a789-072d4e7c7a2f
md"""# Data Collection as Abstraction"""

# ╔═╡ 0c1136e7-53ac-46f5-b58c-4c80da0dcc8b
html"""
(<a data-flickr-embed="true" href="https://www.flickr.com/photos/vahemart/31475770070" title="Pasadena, Norton Simon Museum, Picasso P. The Bull, 1946"><img src="https://live.staticflickr.com/5613/31475770070_f678cf245c_b.jpg" width="1024" height="569" alt="Pasadena, Norton Simon Museum, Picasso P. The Bull, 1946"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>"""

# ╔═╡ cfc1481b-2ba1-4b0a-8df6-1426887098fb
mutable struct DP
	value::String
	category::String
end

# ╔═╡ dda0c810-3ad1-4c72-a28d-cd32a0540db5
mutable struct DDP
	dind::Int64
	data
end

# ╔═╡ 8ae64b39-cd4f-4b4c-8fbc-de2cd272d87c
dp = DP("None", "")

# ╔═╡ 4fea730f-ec8b-443b-9e85-3f950810555f
md"""Data Value:
$(@bind dv TextField())
Data category
$(@bind dc Select(["Administrative", "Clinical", "Demographic", "Metadata"]))

Submit:
$(@bind go Button("Submit"))
"""

# ╔═╡ b67a22a2-1c63-4d59-9d85-50dd2b82d6ea
begin
	dp.value = dv
	dp.category = dc
	dp
end

# ╔═╡ 27f18bba-4437-43c1-88c6-5420e29e1812
data = Dict()

# ╔═╡ 70646a29-7ac8-43ed-9bef-44757b7ccfdd
ddp = DDP(0, data)

# ╔═╡ c4809dcb-018d-40e0-8538-cd6094dd8582
get(data, 1, "")

# ╔═╡ 27a2958b-596c-46a9-8d64-8787c2286a9d
count = length(data)

# ╔═╡ 79ba9ca4-a406-49b4-bfc2-a338a4587459
dp

# ╔═╡ 5c479232-fa39-44bb-ab0a-6b52ecd9a7f0
edv

# ╔═╡ 9743b9fc-de73-4c61-a72e-e9dae0981108
edv.default = "BC"

# ╔═╡ ceba8bf0-1dbd-45d4-a2ca-4dbd62bd05e2
dv, dc

# ╔═╡ 04b1d8e1-d608-4b15-88a9-22e483cc8ed1
function getLastIndex(dd)
	if length(dd) == 0
		return 0
	else
		sort(collect(keys(dd)))[end]
	end
end

# ╔═╡ 341a2299-4a73-493f-9edb-9946ab72ea54
function getNextIndex(dd)
	if length(dd) == 0
		return 0
	else
		getLastIndex(dd) + 1
	end
end

# ╔═╡ 5e0af51a-a2ff-4212-82dd-3712aad5be11
getNextIndex(data)

# ╔═╡ 919a4b28-70cb-46eb-b856-7bf12f322282
dvr = Ref(dv)

# ╔═╡ 1e25eace-e278-42cb-a7cc-cff59bf2b5fd
dcr = Ref(dc)

# ╔═╡ 5ee86992-73c5-4af9-a812-396dcfdbeae8
begin
	go
	ind = getNextIndex(data)
		
	data[ind] = Dict([("Index", ind), ("Value", dp.value), ("Category", dp.category)])
end

# ╔═╡ fa5f571d-1354-4e0e-953e-1b4fedd29295
typeof(tuple(["data"]))

# ╔═╡ b377b128-c4b6-447d-a998-b285facce998
Set(["Administrative", "Clinical", "Demographic", "Metadata"])

# ╔═╡ 64b99e6d-c0ff-4736-baba-3d6cf1f407ec
function generate_select(dd; category = "Administrative")
	options = [Pair(repr(k), """$(v["Value"]): $(v["Category"])""") 
		          for (k,v) in data if v["Category"] == category]
	Select(options)
end
	

# ╔═╡ 7fc4ac6a-9d21-4af2-99b1-b4c72d221f54
function generate_select_delete(dd)
	options = [Pair(repr(k), """$(v["Value"]): $(v["Category"])""") for (k,v) in data]
	push!(options, Pair("-1", "NA"))
	Select(options, default="-1")
end

# ╔═╡ 89488e6e-ba8f-4848-aa5d-9e32dddd59c5
[typeof(v["Category"]) for (k,v) in data]


# ╔═╡ f730dd53-fecd-4f3d-8829-eed9686b6b48
md"""Select Entry to Edit
$(@bind ei generate_select(data))
"""

# ╔═╡ fd37878d-093b-4c79-9f09-077750165541
begin
	ein = parse(Int64, ei)
md"""Edit Value:
$(@bind nv TextField(default=data[ein]["Value"]))
Edit category
$(@bind nc MultiSelect(["Administrative", "Clinical", "Demographic", "Metadata"],
		            default=data[ein]["Category"]))
"""

end

# ╔═╡ 3e0c4d2c-2134-4aa9-ab45-97ca26ea86e1
begin
	data[ein]["Value"] = nv
	data[ein]["Category"] = nc
end

# ╔═╡ 95cb3a98-a9a0-4e36-bcec-ec7ee75ebd93
data

# ╔═╡ a7774223-fe86-43a2-afc0-858a857495fb
md"""Select Entry to Delete
$(@bind di generate_select_delete(data))
$(@bind dodelete Button("Confirm Delete"))
"""

# ╔═╡ 999f763c-ff73-44ad-8826-543e98597710


# ╔═╡ f0cb1a31-a70d-4a07-a558-b6a568c20334
begin
	dodelete
	delete!(ddp.data, ddp.dind)
	
end

# ╔═╡ fd2a9029-94e9-413e-9bc7-54bb4971c745
data

# ╔═╡ 68b9cec8-3eeb-4530-8ce7-40f0d2346a27
function data2node(nv, mmap, dmap)
    label = "$(dmap[nv]["Value"]): $(dmap[nv]["Category"])"
    if haskey(mmap, nv)
        children = [data2node(c, mmap, dmap) for c in mmap[nv]]
        Pair(label, children)
	else
		Pair(label, "")
    end
end

# ╔═╡ d58fe3bf-e40e-4a96-8cd6-a4d5eede14c7
function data2tv(meta, dmap)
    tree = []
    for dataum in keys(meta)
        node = data2node(dataum, meta, dmap)
        push!(tree, node)
    end
    tree
end

# ╔═╡ 675a489a-1d88-4aa6-a358-f7cd0ed8e0a8
struct FoundData
    raw
    map
end


# ╔═╡ e8dc14af-7542-47ef-be5f-1d8c8f267b0b
function data_to_index_map(data)
    Dict([(d["Index"], d) for d in data])
end

# ╔═╡ 930d08b0-1c26-48da-9d21-c5c17c1c0cd0
function read_data(fname)
    raw = YAML.load_file(fname)
    FoundData(raw, data_to_index_map(raw))
end

# ╔═╡ 31074aa4-de28-41e6-938a-8ad9e0b959f3
bdata = "/Users/brian/Documents/Melbourne/isys_90069/modules/Foundations/MedicalData/BirthData/bec_birth_data_all_with_map.yaml"

# ╔═╡ d2770a88-f918-424e-b899-adf729cecf21
begin
	din = parse(Int64, di)
	rdin = Ref(din)
end

# ╔═╡ 0ec39670-0cee-4699-b7af-7a296ec2a590
ddp.dind = rdin[]

# ╔═╡ 3659db19-f0f7-47df-b23f-96d71bd60710
ddata = YAML.load_file(bdata)

# ╔═╡ 24dd195d-2ad2-40cf-9a82-31043440b741
keys(ddata)

# ╔═╡ ec759f2d-7bb3-4212-ab8d-1aa840851f4e
dmap = data_to_index_map(ddata["raw_data"])

# ╔═╡ 84bfa1b5-3612-4dba-ba6f-8f0ab12c634e
vd = data2tv(ddata["meta_map"], dmap)

# ╔═╡ fbe8f51f-7b88-4e25-be2d-d58461092f8f
show(pprint(vd))

# ╔═╡ 4d1ea5b1-9e31-467e-8247-291641d878c2
vdd = [d for d in vd]

# ╔═╡ 630757a3-8c5a-4c3c-9aae-628d4253b235
typeof(vdd)

# ╔═╡ a0bc4350-a777-4586-8711-704fc6603e3c


# ╔═╡ 500476c5-a031-47d2-83e9-d5f321cbc1cb
html"""<h2>Hello, Brian</h2>"""

# ╔═╡ 77ea9a70-a091-49aa-b9e8-fdad639214f8
io = IOBuffer()

# ╔═╡ e4608205-401b-480c-b184-1b43a032e8a9
pprint(io, vdd)

# ╔═╡ 7de9490d-1fca-446e-bac3-1479437cae41
ts = String(take!(io))

# ╔═╡ 39b0935a-d6fa-49e8-8ae4-2c2288ab437c
md"""$(ts)"""

# ╔═╡ e369af66-985b-4c09-b2b0-86bef2d3339a


# ╔═╡ 427b7fdb-cade-4303-b38f-6399154d24ab
let
	    content = md"""The above macro generates two functions, one is `f` and another is `~f` (or `Inv(f)`). The `x += y * constant` is translated to function `(x, y, constant) = PlusEq(*)(x, y, constant)`, where the function `PlusEq(*)` is clearly bijective.
    blablabla...
    """
	    HTML("<details><summary><strong>For experts</strong></summary>$(html(content))</details>")
    end

# ╔═╡ 4379a3ca-743e-4ada-a5f6-9fabb1f74dbf
content = md"""The above macro generates two functions, one is `f` and another is `~f` (or `Inv(f)`). The `x += y * constant` is translated to function `(x, y, constant) = PlusEq(*)(x, y, constant)`, where the function `PlusEq(*)` is clearly bijective.
    blablabla...
    """
	    HTML("<details><summary><strong>For experts</strong></summary>$(html(content))</details>")

# ╔═╡ 81723365-c5fb-4e87-865a-d9bbb2ea216c
begin
	b = @bind reveal html"<input type=checkbox>"
	md"""
	## Example
	Reveal the rest of this notebook: $(b)
	"""
end

# ╔═╡ 13bffd02-aa18-4d84-bef1-abaa9c68fc55
hide_everything_below =
	html"""
	<style>
	pluto-cell.hide_everything_below ~ pluto-cell {
		display: none;
	}
	</style>
	
	<script>
	const cell = currentScript.closest("pluto-cell")
	
	const setclass = () => {
		console.log("change!")
		cell.classList.toggle("hide_everything_below", true)
	}
	setclass()
	const observer = new MutationObserver(setclass)
	
	observer.observe(cell, {
		subtree: false,
		attributeFilter: ["class"],
	})
	
	invalidation.then(() => {
		observer.disconnect()
		cell.classList.toggle("hide_everything_below", false)
	})
	
	</script>
	""";

# ╔═╡ 40e7bf65-52e7-4004-ad41-ee4c636fa656
if reveal === true
	md"Here we go!"
else
	hide_everything_below
end


# ╔═╡ d0e28396-93a3-4faf-b081-e1102df125a6


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
PrettyPrinting = "54e16d92-306c-5ea0-a30b-337be88ac337"
YAML = "ddb6d928-2868-570f-bddf-ab3f9cf99eb6"

[compat]
Plots = "~1.20.1"
PlutoUI = "~0.7.9"
PrettyPrinting = "~0.3.2"
YAML = "~0.4.7"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c3598e525718abcc440f69cc6d5f60dda0a1b61e"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.6+5"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "e2f47f6d8337369411569fd45ae5753ca10394c6"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.0+6"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "9995eb3977fbf67b86d0a0a0508e83017ded03f2"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.14.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "32a2b8af383f11cbb65803883837a149d10dfe8a"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.10.12"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "79b9563ef3f2cc5fc6d3046a5ee1a57c9de52495"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.33.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[DataAPI]]
git-tree-sha1 = "ee400abb2298bd13bfc3df1c412ed228061a2385"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.7.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "92d8f9f208637e8d2d28c664051a00569c01493d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.1.5+1"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "LibVPX_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "3cc57ad0a213808473eafef4845a74766242e05f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.3.1+4"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "35895cf184ceaab11fd778b4590144034a167a2f"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.1+14"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "cbd58c9deb1d304f5a245a0b7eb841a2560cfec6"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.1+5"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "dba1e8614e98949abfa60480b13653813d8f0157"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+0"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "182da592436e287758ded5be6e32c406de3a2e47"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.58.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "d59e8320c2747553788e4fc42231489cc602fa50"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.58.1+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "15ff9a14b9e1218958d3530cc288cf31465d9ae2"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.3.13"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "7bf67e9a481712b3dbe9cb3dac852dc4b1162e02"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+0"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "44e3b40da000eab4ccb1aecdc4801c040026aeb5"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.13"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[LaTeXStrings]]
git-tree-sha1 = "c7f1c695e06c01b95a67f0cd1d34994f3e7db104"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.2.1"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a4b12a1bd2ebade87891ab7e36fdbce582301a92"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.6"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[LibVPX_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "12ee7e23fa4d18361e7c2cde8f8337d4c3101bc7"
uuid = "dd192d2f-8180-539f-9fb4-cc70b1dcf69a"
version = "1.10.0+0"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "761a393aeccd6aa92ec3515e428c26bf99575b3b"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+0"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "0fb723cd8c45858c22169b2e42269e53271a6df7"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.7"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "4ea90bd5d3985ae1f9a908bd4500ae88921c5ce7"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.0"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "477bf42b4d1496b454c10cce46645bb5b8a0cf2c"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.2"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "501c20a63a34ac1d015d5304da0e645f42d91c9f"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.11"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "8365fa7758e2e8e4443ce866d6106d8ecbb4474e"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.20.1"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[PrettyPrinting]]
git-tree-sha1 = "a5db8a42938bc65c2679406c51a8f5fe9597c6e7"
uuid = "54e16d92-306c-5ea0-a30b-337be88ac337"
version = "0.3.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "b3fb709f3c97bfc6e948be68beeecb55a0b340ae"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.1"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "2a7a2469ed5d94a98dea0e85c46fa653d76be0cd"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.3.4"

[[Reexport]]
git-tree-sha1 = "5f6c21241f0f655da3952fd60aa18477cf96c220"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.1.0"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3240808c6d463ac46f1c1cd7638375cd22abbccb"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.12"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "fed1ec1e65749c4d96fc20dd13bea72b55457e62"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.9"

[[StringEncodings]]
deps = ["Libiconv_jll"]
git-tree-sha1 = "50ccd5ddb00d19392577902f0079267a72c5ab04"
uuid = "69024149-9ee7-55f6-a4c4-859efe599b68"
version = "0.3.5"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "000e168f5cc9aded17b6999a560b7c11dda69095"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.0"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "d0c690d37c73aeb5ca063056283fde5585a41710"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.5.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll"]
git-tree-sha1 = "2839f1c1296940218e35df0bbb220f2a79686670"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.18.0+4"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[YAML]]
deps = ["Base64", "Dates", "Printf", "StringEncodings"]
git-tree-sha1 = "3c6e8b9f5cdaaa21340f841653942e1a6b6561e5"
uuid = "ddb6d928-2868-570f-bddf-ab3f9cf99eb6"
version = "0.4.7"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "acc685bcf777b2202a904cdcb49ad34c2fa1880c"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.14.0+4"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7a5780a0d9c6864184b3a2eeeb833a0c871f00ab"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "0.1.6+4"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d713c1ce4deac133e3334ee12f4adff07f81778f"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2020.7.14+2"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "487da2f8f2f0c8ee0e83f39d13037d6bbf0a45ab"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.0.0+3"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─7feba529-29c5-4be5-aeba-00db5397c4da
# ╟─2ccc8246-67cd-47ac-82a3-a06b23eb0a7d
# ╟─ccd85c80-99d8-48c5-8a23-143a402d6ff0
# ╟─9064db1d-3031-4e43-943d-1e601821e44f
# ╟─7a611c30-c745-4ade-881e-cec71e4f6973
# ╟─3b245fa2-1f83-45c3-9b3b-5fa62d002818
# ╟─9d4a1119-bbbe-4d26-af88-6789420ab030
# ╟─9a4bd43f-c2ae-4dc1-8b33-6a4422c4bcfb
# ╟─97c45761-4f20-4063-800f-ce9d79111466
# ╟─15193b6b-98b5-4cf6-bf65-3133ca734112
# ╟─bccd1a45-33aa-43a1-8f70-68cd9a40c41f
# ╟─4efcfeaa-eb86-4cf3-b4e9-60210278991a
# ╟─bd257e42-52b5-4fd6-9214-596617a5c10d
# ╟─d95f2476-0286-4aa3-ab25-c6d50b113c04
# ╟─08349618-e3a3-4d99-a56d-e145544266e2
# ╠═bc69ad62-1199-4372-a789-072d4e7c7a2f
# ╠═0c1136e7-53ac-46f5-b58c-4c80da0dcc8b
# ╠═78c5a32c-fef3-11eb-0560-6592672bbca5
# ╠═cfc1481b-2ba1-4b0a-8df6-1426887098fb
# ╠═dda0c810-3ad1-4c72-a28d-cd32a0540db5
# ╠═8ae64b39-cd4f-4b4c-8fbc-de2cd272d87c
# ╠═70646a29-7ac8-43ed-9bef-44757b7ccfdd
# ╠═c4809dcb-018d-40e0-8538-cd6094dd8582
# ╠═b67a22a2-1c63-4d59-9d85-50dd2b82d6ea
# ╠═27a2958b-596c-46a9-8d64-8787c2286a9d
# ╠═4fea730f-ec8b-443b-9e85-3f950810555f
# ╠═27f18bba-4437-43c1-88c6-5420e29e1812
# ╠═79ba9ca4-a406-49b4-bfc2-a338a4587459
# ╠═5c479232-fa39-44bb-ab0a-6b52ecd9a7f0
# ╠═9743b9fc-de73-4c61-a72e-e9dae0981108
# ╠═ceba8bf0-1dbd-45d4-a2ca-4dbd62bd05e2
# ╠═04b1d8e1-d608-4b15-88a9-22e483cc8ed1
# ╠═341a2299-4a73-493f-9edb-9946ab72ea54
# ╠═5e0af51a-a2ff-4212-82dd-3712aad5be11
# ╠═919a4b28-70cb-46eb-b856-7bf12f322282
# ╠═1e25eace-e278-42cb-a7cc-cff59bf2b5fd
# ╠═5ee86992-73c5-4af9-a812-396dcfdbeae8
# ╠═fa5f571d-1354-4e0e-953e-1b4fedd29295
# ╠═b377b128-c4b6-447d-a998-b285facce998
# ╠═64b99e6d-c0ff-4736-baba-3d6cf1f407ec
# ╠═7fc4ac6a-9d21-4af2-99b1-b4c72d221f54
# ╠═89488e6e-ba8f-4848-aa5d-9e32dddd59c5
# ╠═f730dd53-fecd-4f3d-8829-eed9686b6b48
# ╠═fd37878d-093b-4c79-9f09-077750165541
# ╠═3e0c4d2c-2134-4aa9-ab45-97ca26ea86e1
# ╠═95cb3a98-a9a0-4e36-bcec-ec7ee75ebd93
# ╠═a7774223-fe86-43a2-afc0-858a857495fb
# ╠═999f763c-ff73-44ad-8826-543e98597710
# ╠═0ec39670-0cee-4699-b7af-7a296ec2a590
# ╠═f0cb1a31-a70d-4a07-a558-b6a568c20334
# ╠═fd2a9029-94e9-413e-9bc7-54bb4971c745
# ╠═68b9cec8-3eeb-4530-8ce7-40f0d2346a27
# ╠═d58fe3bf-e40e-4a96-8cd6-a4d5eede14c7
# ╠═675a489a-1d88-4aa6-a358-f7cd0ed8e0a8
# ╠═e8dc14af-7542-47ef-be5f-1d8c8f267b0b
# ╠═930d08b0-1c26-48da-9d21-c5c17c1c0cd0
# ╠═31074aa4-de28-41e6-938a-8ad9e0b959f3
# ╠═d2770a88-f918-424e-b899-adf729cecf21
# ╠═3659db19-f0f7-47df-b23f-96d71bd60710
# ╠═24dd195d-2ad2-40cf-9a82-31043440b741
# ╠═ec759f2d-7bb3-4212-ab8d-1aa840851f4e
# ╠═84bfa1b5-3612-4dba-ba6f-8f0ab12c634e
# ╠═fbe8f51f-7b88-4e25-be2d-d58461092f8f
# ╠═4d1ea5b1-9e31-467e-8247-291641d878c2
# ╠═630757a3-8c5a-4c3c-9aae-628d4253b235
# ╠═a0bc4350-a777-4586-8711-704fc6603e3c
# ╠═500476c5-a031-47d2-83e9-d5f321cbc1cb
# ╠═77ea9a70-a091-49aa-b9e8-fdad639214f8
# ╠═e4608205-401b-480c-b184-1b43a032e8a9
# ╠═7de9490d-1fca-446e-bac3-1479437cae41
# ╠═39b0935a-d6fa-49e8-8ae4-2c2288ab437c
# ╠═e369af66-985b-4c09-b2b0-86bef2d3339a
# ╠═427b7fdb-cade-4303-b38f-6399154d24ab
# ╠═4379a3ca-743e-4ada-a5f6-9fabb1f74dbf
# ╠═81723365-c5fb-4e87-865a-d9bbb2ea216c
# ╠═13bffd02-aa18-4d84-bef1-abaa9c68fc55
# ╠═40e7bf65-52e7-4004-ad41-ee4c636fa656
# ╠═d0e28396-93a3-4faf-b081-e1102df125a6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
