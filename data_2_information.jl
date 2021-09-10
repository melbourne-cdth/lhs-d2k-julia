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
end


# ╔═╡ 7feba529-29c5-4be5-aeba-00db5397c4da
md"""
# Identifying, Labeling, and Relating Biomedical Data

In this notebook we will be exploring what data look like in biomedical documents and how combining data creates information. For this exercise, our view of data and is strongly informed by this 

## Big Picture View of Data

> Data...is the raw stuff: what is collected by instrumentation or machinery. The stream of bits sent to Earth by a Mars Rover, for example, is data. The signal carried by radio frequencies between your phone and the local cell tower is data....
> 
> 
> Data is stuff. It is raw, unprocessed, possibly even untouched by human hands, unviewed by human eyes, un-thought-about by human minds. We’re not used to thinking of information objects in this way: we’re used to thinking of information objects as things like books, or files on our computer, things that have been deliberately created by humans, and where human understanding is an integral part of their creation. However, think about the stream of bits sent to Earth by the Mars Rover, or a book in, for example, [Lushootseed](https://en.wikipedia.org/wiki/Lushootseed) (or some other language that you neither speak nor read… and apologies if you actually do know Lushootseed): you may know that a stream of bits or a book in Lushootseed has some meaning embedded in it, but without some processing, that meaning is not accessible to you. **Data is potential information, analogous to potential energy: work is required to release it.** (Pomerantz, Jeffrey. *Metadata (MIT Press Essential Knowledge series)* (pp. 20-21). The MIT Press. Kindle Edition.)

## Operational Definition of Data

We are going to follow what is known as the __The Diaphoric Definition of Data (DDD):__

> A datum is a putative fact regarding some difference or lack of uniformity within some context. ([Floridi, Luciano, "Semantic Conceptions of Information"](https://plato.stanford.edu/entries/information-semantic/))

The context may be physical or symbolic.

### Physical Example

The data collected in an ECG are measurements of __differences__ in [__electrical potential__](https://en.wikipedia.org/wiki/Electric_potential) between different locations on the skin.

### Symbolic Examples

#### Letters

The modern English alphabet consists of 26 lower-case and 26 upper-case letters. It is sometimes referred to as the Latin alphabet (for example in computer type standards), although it differs slightly from the classical Latin alphabet (Classical Latin did not have _J_, _U_, or _W_). In this context __a__ and __D__ would each be a _datum_ as they are different symbols.

#### Words

In a different context we may want to consider a word as a datum. So instead of viewing __BRIAN__ as the data set __{B__, __R__, __I__, __A__, __N}__, __BRIAN__ is a single datum that differs from __BRAIN__, for example, within the context of English

## Exercise

Can you think of contexts where __Brian Chapman__ would represent a data set with

- 13 elements?
- 12 elements?
- 2 elements?
- 1 element?

$(@bind myNameContext TextField((80,7)))
"""

# ╔═╡ 2acf7039-a934-43fa-b956-d581b5d49169
let myNameContextAns = md"""

- __13 elements:__ There are 13 characters (counting the space between "Brian" and "Chapman" as a character) in the string. I might not want to differentiate between letters and spaces if I was figuring out how to typeset the string for printing.
- __12 elements:__ There are 12 letters in the string. I may be interested in the letters and no tthe space if were counting letter frequency, for example trying to encrypt or decrypt a message.
- __2 elements:__ There are two words if a view the space as delimiting words.
- __1 element:__ In the context of names, there is one name in the string.
"""
	
HTML("<details><summary><strong>My Answers</strong></summary>$(html(myNameContextAns))</details>")
    end

# ╔═╡ cf21da1c-7474-409f-99c8-2e3a860a8820
length(Set("Brian Chapman"))

# ╔═╡ f541f5dc-17d5-4258-a3c7-d47e560e12db
length("Brian Chapman")

# ╔═╡ c68c0ad4-350d-4257-8a64-95cc51298011







In the David Nicholls case study there are a number of physical data that are collected.

For example, an ECG is a measurement of a __difference__ in __electrical voltage__ on different locations on the skin at different points of time.

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
#### At the most "atomistic" view we have the following data:

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

# ╔═╡ 7d6a346a-cfc6-42b4-ad9e-5a70d958a2eb
md"""![an image](https://github.com/chapmanbe/raw-stuff/blob/main/bmi_names.png?raw=true)"""

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
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "438d35d2d95ae2c5e8780b330592b6de8494e779"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.3"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═7feba529-29c5-4be5-aeba-00db5397c4da
# ╠═2acf7039-a934-43fa-b956-d581b5d49169
# ╠═cf21da1c-7474-409f-99c8-2e3a860a8820
# ╠═f541f5dc-17d5-4258-a3c7-d47e560e12db
# ╠═c68c0ad4-350d-4257-8a64-95cc51298011
# ╟─2ccc8246-67cd-47ac-82a3-a06b23eb0a7d
# ╠═ccd85c80-99d8-48c5-8a23-143a402d6ff0
# ╟─9064db1d-3031-4e43-943d-1e601821e44f
# ╠═7a611c30-c745-4ade-881e-cec71e4f6973
# ╠═3b245fa2-1f83-45c3-9b3b-5fa62d002818
# ╟─9d4a1119-bbbe-4d26-af88-6789420ab030
# ╟─9a4bd43f-c2ae-4dc1-8b33-6a4422c4bcfb
# ╟─97c45761-4f20-4063-800f-ce9d79111466
# ╟─15193b6b-98b5-4cf6-bf65-3133ca734112
# ╟─bccd1a45-33aa-43a1-8f70-68cd9a40c41f
# ╟─4efcfeaa-eb86-4cf3-b4e9-60210278991a
# ╟─bd257e42-52b5-4fd6-9214-596617a5c10d
# ╟─d95f2476-0286-4aa3-ab25-c6d50b113c04
# ╟─08349618-e3a3-4d99-a56d-e145544266e2
# ╠═7d6a346a-cfc6-42b4-ad9e-5a70d958a2eb
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
