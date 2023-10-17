<script lang="ts">
	import { Label, Textarea, Toggle } from 'flowbite-svelte';
	import { slide } from 'svelte/transition';

	let input: string = '';
	let output: string = '';

	let decode = false;

	function toHex() {
		let result = '';
		for (let i = 0; i < input.length; i += 1) {
			result += input.charCodeAt(i).toString(16);
		}
		return result;
	}

	function fromHex() {
		let str = '';
		for (let i = 0; i < input.length; i += 2) {
			// this might be depracated, but it works :p
			const hexValue = input.substr(i, 2);
			const decimalValue = parseInt(hexValue, 16);
			str += String.fromCharCode(decimalValue);
		}
		return str.toString();
	}

	function hexHelper() {
		if (decode) {
			output = fromHex();
		} else {
			output = toHex();
		}
	}

	function flipInOut() {
		[input, output] = [output, input];
	}
</script>

<div
	class="w-2/3 flex flex-col"
	in:slide={{ duration: 300, delay: 300 }}
	out:slide={{ duration: 300 }}
>
	<h1 class="text-[40px] mt-8 self-center">Hex</h1>
	<div class="flex flex-col gap-10 grow justify-center">
		<div>
			<Label for="textarea-id" class="mb-2">Input</Label>
			<Textarea
				id="textarea-id"
				placeholder="Your text here"
				rows="4"
				name="message"
				class="resize-none"
				bind:value={input}
				on:keyup={hexHelper}
			/>
		</div>
		<div>
			<Label for="textarea-id" class="mb-2">Output</Label>
			<Textarea
				id="textarea-id"
				placeholder="Your text here"
				rows="4"
				name="message"
				class="resize-none"
				bind:value={output}
			/>
		</div>
		<Toggle bind:checked={decode} on:change={flipInOut}>Decode</Toggle>
	</div>
</div>
