<script lang="ts">
	import { fade } from 'svelte/transition';
  import { base } from '$app/paths';
</script>

<div
	class="w-full h-full flex justify-center items-center text-white bg-[#210028] select-none"
	transition:fade
>
	<h1 class="text-[72px]">
		<svg viewBox="0 0 960 300">
			<symbol id="s-text">
				<text text-anchor="middle" x="50%" y="80%">dev.rond.cc</text>
			</symbol>

			<g class="g-ants">
				<use xlink:href="#s-text" class="text-copy" />
				<use xlink:href="#s-text" class="text-copy" />
				<use xlink:href="#s-text" class="text-copy" />
				<use xlink:href="#s-text" class="text-copy" />
				<use xlink:href="#s-text" class="text-copy" />
			</g>
		</svg>
	</h1>
	<div class="flex absolute left-12 bottom-8 gap-16 text-[28px]">
		<a href="{base}/" class="link cursor-pointer">/</a>
		<a href="{base}/tools" class="link cursor-pointer">Tools</a>
	</div>
</div>

<style>
	.link {
		transform: scale(1);
		transition-property: transform;
		transition-duration: 0.3s;
	}
	.link:hover {
		transform: scale(1.2);
		text-shadow: #4400ff 1px 0 10px;
	}
	svg {
		display: block;
		font: 2em 'Montserrat';
		width: 1080px;
		height: 300px;
		margin: 0 auto;
	}

	.text-copy {
		fill: none;
		stroke: white;
		stroke-dasharray: 6% 29%;
		stroke-width: 5px;
		stroke-dashoffset: 0%;
		animation: stroke-offset 7s infinite linear;
	}

	.text-copy:nth-child(1) {
		stroke: #d782ba;
		animation-delay: -1;
	}

	.text-copy:nth-child(2) {
		stroke: #e18ad4;
		animation-delay: -2s;
	}

	.text-copy:nth-child(3) {
		stroke: #eeb1d5;
		animation-delay: -3s;
	}

	.text-copy:nth-child(4) {
		stroke: #944654;
		animation-delay: -4s;
	}

	.text-copy:nth-child(5) {
		stroke: #85ff9e;
		animation-delay: -5s;
	}

	@keyframes stroke-offset {
		100% {
			stroke-dashoffset: -35%;
		}
	}
</style>
