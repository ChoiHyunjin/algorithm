class Solution {
   public void flatten(TreeNode root) {
      if (root == null) {
         return;
      }
      if (root.left == null && root.right == null) {
         return;
      }

      List<Integer> result = new ArrayList<>();
      makePreOrderResult(result, root);

      makeAnswer(result, root);
   }

   private void makeAnswer(List<Integer> result, TreeNode root) {
      root.val = result.get(0);
      root.left = null;

      TreeNode before = root;
      for (int i = 1; i < result.size(); i++) {
         TreeNode node = new TreeNode();
         node.val = result.get(i);

         before.right = node;
         before = node;
      }
   }

   private void makePreOrderResult(List<Integer> result, TreeNode node) {
      result.add(node.val);
      if (node.left != null) {
         makePreOrderResult(result, node.left);
      }

      if (node.right != null) {
         makePreOrderResult(result, node.right);
      }
   }
}