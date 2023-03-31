import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({Key? key, required this.onSearchSubmit}) : super(key: key);

  final ValueChanged<String> onSearchSubmit;

  @override
  State<SearchBar> createState() => _SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController()..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.value.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _controller.clear();
                    widget.onSearchSubmit('');
                  },
                  icon: const Icon(Icons.close),
                )
              : null,
          border: const UnderlineInputBorder(),
        ),
        onFieldSubmitted: widget.onSearchSubmit,
      ),
    );
  }
}
