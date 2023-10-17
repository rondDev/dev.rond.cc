<script lang="ts">
	import type { Link } from '../../routes/links/+page.server';

	export let links: Link[];
	// console.log(links);
</script>

<!-- TODO: to be implemented -->
{#each links as link}
	{#if link}
		<a class="dec bg-slate-300 text-red-600" href={link.link}>{link.title}</a>
		<br />
	{/if}
{/each}
