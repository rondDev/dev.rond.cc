<script lang="ts">
	import { page } from '$app/stores';
	import {
		Card,
		Sidebar,
		SidebarBrand,
		SidebarGroup,
		SidebarItem,
		SidebarWrapper
	} from 'flowbite-svelte';
	import Base64 from '$lib/components/logos/Base64.svelte';
	import Hex from '$lib/components/logos/Hex.svelte';
	import Md5 from '$lib/components/logos/Md5.svelte';
	import Url from '$lib/components/logos/Url.svelte';
	import Sha1 from '$lib/components/logos/Sha1.svelte';
	import Jwt from '$lib/components/logos/Jwt.svelte';
	import TextCase from '$lib/components/logos/TextCase.svelte';
	import Whitespace from '$lib/components/logos/Whitespace.svelte';
	import MainLogo from '$lib/components/logos/MainLogo.svelte';
	import { fade } from 'svelte/transition';

	let site = {
		name: '',
		href: '/tools',
		// direct link because can't be asked to figure out how to do relative path :p
		img: 'https://i.rond.cc/api/Fpt5EYHkKhJj.svg'
	};

	let activeUrl: string;
	let isBase: boolean;
	$: {
		activeUrl = $page.url.pathname;
		isBase = activeUrl == '/tools';
	}
</script>

<!-- class="h-[50vh] w-[85vw] bg-[#522780] text-[#F8EEFC] flex justify-center items-center rounded-2xl shadow-purple-900 shadow-lg" -->
<div class="flex justify-center items-center h-full" in:fade>
	<div
		class="min-h-[50vh] w-[85vw] bg-[#402766] <!-- text-white --> text-[#F8EEFC] flex justify-center items-center rounded-2xl shadow-purple-900 shadow-lg"
	>
		<div class="min-h-[50vh] w-full flex">
			{#if !isBase}
				<Sidebar {activeUrl} class="min-h-full">
					<SidebarWrapper class="h-full rounded-xl">
						<SidebarBrand {site} />
						<SidebarGroup>
							<SidebarItem label="Base64" href="/tools/encode-decode/base64">
								<svelte:fragment slot="icon">
									<Base64 />
								</svelte:fragment>
							</SidebarItem>
							<SidebarItem label="Hex" href="/tools/converters/hex">
								<svelte:fragment slot="icon">
									<Hex />
								</svelte:fragment>
							</SidebarItem>
						</SidebarGroup>
						<SidebarGroup border>
							<SidebarItem label="MD5" href="/tools/md5">
								<svelte:fragment slot="icon">
									<Md5 />
								</svelte:fragment>
							</SidebarItem>
							<SidebarItem label="SHA1" href="/tools/sha1">
								<svelte:fragment slot="icon">
									<Sha1 />
								</svelte:fragment>
							</SidebarItem>
						</SidebarGroup>
						<SidebarGroup border>
							<SidebarItem label="URL" href="/tools/encode-decode/url">
								<svelte:fragment slot="icon">
									<Url />
								</svelte:fragment>
							</SidebarItem>
							<SidebarItem label="JWT" href="/tools/encode-decode/">
								<svelte:fragment slot="icon">
									<Jwt />
								</svelte:fragment>
							</SidebarItem>
						</SidebarGroup>
						<SidebarGroup border>
							<SidebarItem label="Text Case" href="/tools/textcase">
								<svelte:fragment slot="icon">
									<TextCase />
								</svelte:fragment>
							</SidebarItem>
							<SidebarItem label="Whitespace" href="/tools/whitespace">
								<svelte:fragment slot="icon">
									<Whitespace />
								</svelte:fragment>
							</SidebarItem>
						</SidebarGroup>
					</SidebarWrapper>
				</Sidebar>
				<div class="w-full h-full flex flex-col justify-center items-center">
					<slot />
				</div>
			{:else}
				<div id="container" class="w-full flex flex-col items-center select-none">
					<div id="logo" class="h-[20vh] w-[50vw] pt-8">
						<a href="/">
							<MainLogo />
						</a>
					</div>
					<div id="cards" class="w-full grow grid grid-cols-4 grid-rows-2 p-16 gap-8">
						<Card href="/tools/encode-decode/base64">
							<div class="cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">Base 64</h2>
								<h3>Encode and decode Base64 data</h3>
							</div>
						</Card>
						<Card href="/tools/converters/hex">
							<div class="cardhover cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">Hex</h2>
								<h3>Convert value between Hex and text</h3>
							</div>
						</Card>
						<Card href="/tools/md5">
							<div class="cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">MD5</h2>
								<h3>Hash and dehash MD5 data</h3>
							</div>
						</Card>
						<Card href="/tools/sha1">
							<div class="cardhover cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">SHA1</h2>
								<h3>Hash and dehash SHA1 data</h3>
							</div>
						</Card>
						<Card href="/tools/encode-decode/url">
							<div class="cardhover cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">URL</h2>
								<h3>Encode and decode URL snippets</h3>
							</div>
						</Card>
						<Card href="/tools/encode-decode/">
							<div class="cardhover cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">JWT</h2>
								<h3>Encode and decode JSON Web Token</h3>
							</div>
						</Card>
						<Card href="/tools/textcase">
							<div class="cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">Text-case</h2>
								<h3>Change case of text snippets</h3>
							</div>
						</Card>
						<Card href="/tools/whitespace">
							<div class="cardhover flex flex-col items-center justify-center h-full">
								<h2 class="text-[24px] text-white font-semibold">Whitespace</h2>
								<h3>Removes whitespace from text</h3>
							</div>
						</Card>
					</div>
				</div>
			{/if}
		</div>
	</div>
</div>

<style>
	.cardhover {
		transform: scale(1);
		transition-property: transform;
		transition-duration: 0.2s;
	}

	.cardhover:hover {
		transform: scale(1.05);
	}
</style>
